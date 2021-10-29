#!/usr/bin/env python3

import json


async def generate(hub, **pkginfo):
	json_data = await hub.pkgtools.fetch.get_page(f"https://api.github.com/repos/zerotier/ZeroTierOne/releases", is_json=True)
	for release in json_data:
		if release["draft"] or release["prerelease"]:
			continue
		try:
			version = release["tag_name"]
			list(map(int, version.split(".")))
			break

		except (ValueError, KeyError):
			continue

	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		artifacts=[
			hub.pkgtools.ebuild.Artifact(
				url=f"https://github.com/zerotier/ZeroTierOne/archive/{version}.tar.gz",
				final_name=f"zerotier-{version}.tar.gz",
			)
		],
	)
	ebuild.push()


# vim: ts=4 sw=4 noet
