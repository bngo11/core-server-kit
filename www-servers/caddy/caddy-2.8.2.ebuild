# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fcaps go-module user

EGO_SUM=(
	"cloud.google.com/go v0.112.1"
	"cloud.google.com/go/auth v0.4.1"
	"cloud.google.com/go/auth v0.4.1/go.mod"
	"cloud.google.com/go/auth/oauth2adapt v0.2.2"
	"cloud.google.com/go/auth/oauth2adapt v0.2.2/go.mod"
	"cloud.google.com/go/compute v1.24.0"
	"cloud.google.com/go/compute/metadata v0.3.0"
	"cloud.google.com/go/compute/metadata v0.3.0/go.mod"
	"cloud.google.com/go/iam v1.1.8"
	"cloud.google.com/go/iam v1.1.8/go.mod"
	"cloud.google.com/go/kms v1.16.0"
	"cloud.google.com/go/kms v1.16.0/go.mod"
	"cloud.google.com/go/longrunning v0.5.7"
	"cloud.google.com/go/longrunning v0.5.7/go.mod"
	"filippo.io/edwards25519 v1.1.0"
	"filippo.io/edwards25519 v1.1.0/go.mod"
	"github.com/!andreas!briese/bbloom v0.0.0-20190825152654-46b345b51c96"
	"github.com/!andreas!briese/bbloom v0.0.0-20190825152654-46b345b51c96/go.mod"
	"github.com/!burnt!sushi/toml v0.3.1/go.mod"
	"github.com/!burnt!sushi/toml v1.3.2"
	"github.com/!burnt!sushi/toml v1.3.2/go.mod"
	"github.com/!masterminds/goutils v1.1.1"
	"github.com/!masterminds/goutils v1.1.1/go.mod"
	"github.com/!masterminds/semver/v3 v3.1.1/go.mod"
	"github.com/!masterminds/semver/v3 v3.2.0"
	"github.com/!masterminds/semver/v3 v3.2.0/go.mod"
	"github.com/!masterminds/sprig/v3 v3.2.3"
	"github.com/!masterminds/sprig/v3 v3.2.3/go.mod"
	"github.com/!microsoft/go-winio v0.6.0"
	"github.com/!microsoft/go-winio v0.6.0/go.mod"
	"github.com/!one!of!one/xxhash v1.2.2"
	"github.com/!one!of!one/xxhash v1.2.2/go.mod"
	"github.com/alecthomas/assert/v2 v2.6.0"
	"github.com/alecthomas/assert/v2 v2.6.0/go.mod"
	"github.com/alecthomas/chroma/v2 v2.2.0/go.mod"
	"github.com/alecthomas/chroma/v2 v2.13.0"
	"github.com/alecthomas/chroma/v2 v2.13.0/go.mod"
	"github.com/alecthomas/repr v0.0.0-20220113201626-b1b626ac65ae/go.mod"
	"github.com/alecthomas/repr v0.4.0"
	"github.com/alecthomas/repr v0.4.0/go.mod"
	"github.com/antlr4-go/antlr/v4 v4.13.0"
	"github.com/antlr4-go/antlr/v4 v4.13.0/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/aryann/difflib v0.0.0-20210328193216-ff5ff6dc229b"
	"github.com/aryann/difflib v0.0.0-20210328193216-ff5ff6dc229b/go.mod"
	"github.com/aws/aws-sdk-go-v2 v1.26.1"
	"github.com/aws/aws-sdk-go-v2 v1.26.1/go.mod"
	"github.com/aws/aws-sdk-go-v2/config v1.27.13"
	"github.com/aws/aws-sdk-go-v2/config v1.27.13/go.mod"
	"github.com/aws/aws-sdk-go-v2/credentials v1.17.13"
	"github.com/aws/aws-sdk-go-v2/credentials v1.17.13/go.mod"
	"github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.1"
	"github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.1/go.mod"
	"github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.5"
	"github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.5/go.mod"
	"github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.5"
	"github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.5/go.mod"
	"github.com/aws/aws-sdk-go-v2/internal/ini v1.8.0"
	"github.com/aws/aws-sdk-go-v2/internal/ini v1.8.0/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.11.2"
	"github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.11.2/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.11.7"
	"github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.11.7/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/kms v1.31.1"
	"github.com/aws/aws-sdk-go-v2/service/kms v1.31.1/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/sso v1.20.6"
	"github.com/aws/aws-sdk-go-v2/service/sso v1.20.6/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/ssooidc v1.24.0"
	"github.com/aws/aws-sdk-go-v2/service/ssooidc v1.24.0/go.mod"
	"github.com/aws/aws-sdk-go-v2/service/sts v1.28.7"
	"github.com/aws/aws-sdk-go-v2/service/sts v1.28.7/go.mod"
	"github.com/aws/smithy-go v1.20.2"
	"github.com/aws/smithy-go v1.20.2/go.mod"
	"github.com/beorn7/perks v1.0.1"
	"github.com/beorn7/perks v1.0.1/go.mod"
	"github.com/caddyserver/certmagic v0.21.3"
	"github.com/caddyserver/certmagic v0.21.3/go.mod"
	"github.com/caddyserver/zerossl v0.1.3"
	"github.com/caddyserver/zerossl v0.1.3/go.mod"
	"github.com/cenkalti/backoff/v4 v4.2.1"
	"github.com/cenkalti/backoff/v4 v4.2.1/go.mod"
	"github.com/cespare/xxhash v1.1.0"
	"github.com/cespare/xxhash v1.1.0/go.mod"
	"github.com/cespare/xxhash/v2 v2.1.1/go.mod"
	"github.com/cespare/xxhash/v2 v2.2.0"
	"github.com/cespare/xxhash/v2 v2.2.0/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/logex v1.2.1"
	"github.com/chzyer/logex v1.2.1/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/readline v1.5.1"
	"github.com/chzyer/readline v1.5.1/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/chzyer/test v1.0.0"
	"github.com/chzyer/test v1.0.0/go.mod"
	"github.com/cockroachdb/apd v1.1.0"
	"github.com/cockroachdb/apd v1.1.0/go.mod"
	"github.com/coreos/etcd v3.3.10+incompatible/go.mod"
	"github.com/coreos/go-etcd v2.0.0+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e/go.mod"
	"github.com/coreos/go-systemd v0.0.0-20190719114852-fd7a80b32e1f/go.mod"
	"github.com/cpuguy83/go-md2man v1.0.10/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.2/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.3"
	"github.com/cpuguy83/go-md2man/v2 v2.0.3/go.mod"
	"github.com/creack/pty v1.1.7/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgraph-io/badger v1.6.2"
	"github.com/dgraph-io/badger v1.6.2/go.mod"
	"github.com/dgraph-io/badger/v2 v2.2007.4"
	"github.com/dgraph-io/badger/v2 v2.2007.4/go.mod"
	"github.com/dgraph-io/ristretto v0.0.2/go.mod"
	"github.com/dgraph-io/ristretto v0.0.3-0.20200630154024-f66de99634de/go.mod"
	"github.com/dgraph-io/ristretto v0.1.0"
	"github.com/dgraph-io/ristretto v0.1.0/go.mod"
	"github.com/dgryski/go-farm v0.0.0-20190423205320-6a90982ecee2/go.mod"
	"github.com/dgryski/go-farm v0.0.0-20200201041132-a6ae2369ad13"
	"github.com/dgryski/go-farm v0.0.0-20200201041132-a6ae2369ad13/go.mod"
	"github.com/dlclark/regexp2 v1.4.0/go.mod"
	"github.com/dlclark/regexp2 v1.7.0/go.mod"
	"github.com/dlclark/regexp2 v1.11.0"
	"github.com/dlclark/regexp2 v1.11.0/go.mod"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/dustin/go-humanize v1.0.1"
	"github.com/dustin/go-humanize v1.0.1/go.mod"
	"github.com/felixge/httpsnoop v1.0.4"
	"github.com/felixge/httpsnoop v1.0.4/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/fxamacker/cbor/v2 v2.6.0"
	"github.com/fxamacker/cbor/v2 v2.6.0/go.mod"
	"github.com/go-chi/chi/v5 v5.0.12"
	"github.com/go-chi/chi/v5 v5.0.12/go.mod"
	"github.com/go-jose/go-jose/v3 v3.0.3"
	"github.com/go-jose/go-jose/v3 v3.0.3/go.mod"
	"github.com/go-kit/kit v0.4.0/go.mod"
	"github.com/go-kit/kit v0.13.0"
	"github.com/go-kit/kit v0.13.0/go.mod"
	"github.com/go-kit/log v0.1.0/go.mod"
	"github.com/go-kit/log v0.2.1"
	"github.com/go-kit/log v0.2.1/go.mod"
	"github.com/go-logfmt/logfmt v0.5.0/go.mod"
	"github.com/go-logfmt/logfmt v0.5.1/go.mod"
	"github.com/go-logfmt/logfmt v0.6.0"
	"github.com/go-logfmt/logfmt v0.6.0/go.mod"
	"github.com/go-logr/logr v1.2.2/go.mod"
	"github.com/go-logr/logr v1.4.1"
	"github.com/go-logr/logr v1.4.1/go.mod"
	"github.com/go-logr/stdr v1.2.2"
	"github.com/go-logr/stdr v1.2.2/go.mod"
	"github.com/go-sql-driver/mysql v1.7.1"
	"github.com/go-sql-driver/mysql v1.7.1/go.mod"
	"github.com/go-stack/stack v1.6.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572"
	"github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572/go.mod"
	"github.com/gofrs/uuid v4.0.0+incompatible"
	"github.com/gofrs/uuid v4.0.0+incompatible/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/glog v1.2.0"
	"github.com/golang/glog v1.2.0/go.mod"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.5.4"
	"github.com/golang/protobuf v1.5.4/go.mod"
	"github.com/golang/snappy v0.0.3/go.mod"
	"github.com/golang/snappy v0.0.4"
	"github.com/golang/snappy v0.0.4/go.mod"
	"github.com/google/btree v1.1.2"
	"github.com/google/btree v1.1.2/go.mod"
	"github.com/google/cel-go v0.20.1"
	"github.com/google/cel-go v0.20.1/go.mod"
	"github.com/google/certificate-transparency-go v1.0.21/go.mod"
	"github.com/google/certificate-transparency-go v1.1.8-0.20240110162603-74a5dd331745"
	"github.com/google/certificate-transparency-go v1.1.8-0.20240110162603-74a5dd331745/go.mod"
	"github.com/google/go-cmp v0.5.9/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/google/go-tpm v0.9.0"
	"github.com/google/go-tpm v0.9.0/go.mod"
	"github.com/google/go-tpm-tools v0.4.4"
	"github.com/google/go-tpm-tools v0.4.4/go.mod"
	"github.com/google/go-tspi v0.3.0"
	"github.com/google/go-tspi v0.3.0/go.mod"
	"github.com/google/pprof v0.0.0-20231212022811-ec68065c825e"
	"github.com/google/pprof v0.0.0-20231212022811-ec68065c825e/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/s2a-go v0.1.7"
	"github.com/google/s2a-go v0.1.7/go.mod"
	"github.com/google/uuid v1.1.1/go.mod"
	"github.com/google/uuid v1.6.0"
	"github.com/google/uuid v1.6.0/go.mod"
	"github.com/googleapis/enterprise-certificate-proxy v0.3.2"
	"github.com/googleapis/enterprise-certificate-proxy v0.3.2/go.mod"
	"github.com/googleapis/gax-go/v2 v2.12.4"
	"github.com/googleapis/gax-go/v2 v2.12.4/go.mod"
	"github.com/grpc-ecosystem/grpc-gateway/v2 v2.18.0"
	"github.com/grpc-ecosystem/grpc-gateway/v2 v2.18.0/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hexops/gotextdiff v1.0.3"
	"github.com/hexops/gotextdiff v1.0.3/go.mod"
	"github.com/huandu/xstrings v1.3.3"
	"github.com/huandu/xstrings v1.3.3/go.mod"
	"github.com/imdario/mergo v0.3.11/go.mod"
	"github.com/imdario/mergo v0.3.12"
	"github.com/imdario/mergo v0.3.12/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/jackc/chunkreader v1.0.0/go.mod"
	"github.com/jackc/chunkreader/v2 v2.0.0/go.mod"
	"github.com/jackc/chunkreader/v2 v2.0.1"
	"github.com/jackc/chunkreader/v2 v2.0.1/go.mod"
	"github.com/jackc/pgconn v0.0.0-20190420214824-7e0022ef6ba3/go.mod"
	"github.com/jackc/pgconn v0.0.0-20190824142844-760dd75542eb/go.mod"
	"github.com/jackc/pgconn v0.0.0-20190831204454-2fabfa3c18b7/go.mod"
	"github.com/jackc/pgconn v1.8.0/go.mod"
	"github.com/jackc/pgconn v1.9.0/go.mod"
	"github.com/jackc/pgconn v1.9.1-0.20210724152538-d89c8390a530/go.mod"
	"github.com/jackc/pgconn v1.14.3"
	"github.com/jackc/pgconn v1.14.3/go.mod"
	"github.com/jackc/pgio v1.0.0"
	"github.com/jackc/pgio v1.0.0/go.mod"
	"github.com/jackc/pgmock v0.0.0-20190831213851-13a1b77aafa2/go.mod"
	"github.com/jackc/pgmock v0.0.0-20201204152224-4fe30f7445fd/go.mod"
	"github.com/jackc/pgmock v0.0.0-20210724152146-4ad1a8207f65"
	"github.com/jackc/pgmock v0.0.0-20210724152146-4ad1a8207f65/go.mod"
	"github.com/jackc/pgpassfile v1.0.0"
	"github.com/jackc/pgpassfile v1.0.0/go.mod"
	"github.com/jackc/pgproto3 v1.1.0/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-alpha1.0.20190420180111-c116219b62db/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-alpha1.0.20190609003834-432c2951c711/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-rc3/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.0-rc3.0.20190831210041-4c03ce451f29/go.mod"
	"github.com/jackc/pgproto3/v2 v2.0.6/go.mod"
	"github.com/jackc/pgproto3/v2 v2.1.1/go.mod"
	"github.com/jackc/pgproto3/v2 v2.3.3"
	"github.com/jackc/pgproto3/v2 v2.3.3/go.mod"
	"github.com/jackc/pgservicefile v0.0.0-20200714003250-2b9c44734f2b/go.mod"
	"github.com/jackc/pgservicefile v0.0.0-20221227161230-091c0ba34f0a"
	"github.com/jackc/pgservicefile v0.0.0-20221227161230-091c0ba34f0a/go.mod"
	"github.com/jackc/pgtype v0.0.0-20190421001408-4ed0de4755e0/go.mod"
	"github.com/jackc/pgtype v0.0.0-20190824184912-ab885b375b90/go.mod"
	"github.com/jackc/pgtype v0.0.0-20190828014616-a8802b16cc59/go.mod"
	"github.com/jackc/pgtype v1.8.1-0.20210724151600-32e20a603178/go.mod"
	"github.com/jackc/pgtype v1.14.0"
	"github.com/jackc/pgtype v1.14.0/go.mod"
	"github.com/jackc/pgx/v4 v4.0.0-20190420224344-cc3461e65d96/go.mod"
	"github.com/jackc/pgx/v4 v4.0.0-20190421002000-1b8f0016e912/go.mod"
	"github.com/jackc/pgx/v4 v4.0.0-pre1.0.20190824185557-6972a5742186/go.mod"
	"github.com/jackc/pgx/v4 v4.12.1-0.20210724153913-640aa07df17c/go.mod"
	"github.com/jackc/pgx/v4 v4.18.3"
	"github.com/jackc/pgx/v4 v4.18.3/go.mod"
	"github.com/jackc/puddle v0.0.0-20190413234325-e4ced69a3a2b/go.mod"
	"github.com/jackc/puddle v0.0.0-20190608224051-11cab39313c9/go.mod"
	"github.com/jackc/puddle v1.1.3/go.mod"
	"github.com/jessevdk/go-flags v1.4.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.12.3/go.mod"
	"github.com/klauspost/compress v1.17.8"
	"github.com/klauspost/compress v1.17.8/go.mod"
	"github.com/klauspost/cpuid/v2 v2.0.12/go.mod"
	"github.com/klauspost/cpuid/v2 v2.2.7"
	"github.com/klauspost/cpuid/v2 v2.2.7/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.2.0/go.mod"
	"github.com/kr/pretty v0.3.1"
	"github.com/kr/pretty v0.3.1/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/pty v1.1.8/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/lib/pq v1.0.0/go.mod"
	"github.com/lib/pq v1.1.0/go.mod"
	"github.com/lib/pq v1.2.0/go.mod"
	"github.com/lib/pq v1.10.2/go.mod"
	"github.com/lib/pq v1.10.9"
	"github.com/lib/pq v1.10.9/go.mod"
	"github.com/libdns/libdns v0.2.2"
	"github.com/libdns/libdns v0.2.2/go.mod"
	"github.com/magiconair/properties v1.8.0/go.mod"
	"github.com/manifoldco/promptui v0.9.0"
	"github.com/manifoldco/promptui v0.9.0/go.mod"
	"github.com/mattn/go-colorable v0.1.1/go.mod"
	"github.com/mattn/go-colorable v0.1.6/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.5/go.mod"
	"github.com/mattn/go-isatty v0.0.7/go.mod"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/mgutz/ansi v0.0.0-20200706080929-d51e80ef957d"
	"github.com/mgutz/ansi v0.0.0-20200706080929-d51e80ef957d/go.mod"
	"github.com/mholt/acmez/v2 v2.0.1"
	"github.com/mholt/acmez/v2 v2.0.1/go.mod"
	"github.com/miekg/dns v1.1.59"
	"github.com/miekg/dns v1.1.59/go.mod"
	"github.com/mitchellh/copystructure v1.0.0/go.mod"
	"github.com/mitchellh/copystructure v1.2.0"
	"github.com/mitchellh/copystructure v1.2.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/go-ps v1.0.0"
	"github.com/mitchellh/go-ps v1.0.0/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/mitchellh/reflectwalk v1.0.0/go.mod"
	"github.com/mitchellh/reflectwalk v1.0.2"
	"github.com/mitchellh/reflectwalk v1.0.2/go.mod"
	"github.com/onsi/ginkgo/v2 v2.13.2"
	"github.com/onsi/ginkgo/v2 v2.13.2/go.mod"
	"github.com/onsi/gomega v1.29.0"
	"github.com/onsi/gomega v1.29.0/go.mod"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/peterbourgon/diskv/v3 v3.0.1"
	"github.com/peterbourgon/diskv/v3 v3.0.1/go.mod"
	"github.com/pires/go-proxyproto v0.7.0"
	"github.com/pires/go-proxyproto v0.7.0/go.mod"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/prashantv/gostub v1.1.0"
	"github.com/prashantv/gostub v1.1.0/go.mod"
	"github.com/prometheus/client_golang v1.19.1"
	"github.com/prometheus/client_golang v1.19.1/go.mod"
	"github.com/prometheus/client_model v0.5.0"
	"github.com/prometheus/client_model v0.5.0/go.mod"
	"github.com/prometheus/common v0.48.0"
	"github.com/prometheus/common v0.48.0/go.mod"
	"github.com/prometheus/procfs v0.12.0"
	"github.com/prometheus/procfs v0.12.0/go.mod"
	"github.com/quic-go/qpack v0.4.0"
	"github.com/quic-go/qpack v0.4.0/go.mod"
	"github.com/quic-go/quic-go v0.44.0"
	"github.com/quic-go/quic-go v0.44.0/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/rogpeppe/go-internal v1.10.0"
	"github.com/rogpeppe/go-internal v1.10.0/go.mod"
	"github.com/rs/xid v1.2.1/go.mod"
	"github.com/rs/xid v1.5.0"
	"github.com/rs/xid v1.5.0/go.mod"
	"github.com/rs/zerolog v1.13.0/go.mod"
	"github.com/rs/zerolog v1.15.0/go.mod"
	"github.com/russross/blackfriday v1.5.2/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/satori/go.uuid v1.2.0/go.mod"
	"github.com/schollz/jsonstore v1.1.0"
	"github.com/schollz/jsonstore v1.1.0/go.mod"
	"github.com/shopspring/decimal v0.0.0-20180709203117-cd690d0c9e24/go.mod"
	"github.com/shopspring/decimal v1.2.0"
	"github.com/shopspring/decimal v1.2.0/go.mod"
	"github.com/shurcoo!l/sanitized_anchor_name v1.0.0"
	"github.com/shurcoo!l/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.4.1/go.mod"
	"github.com/sirupsen/logrus v1.4.2/go.mod"
	"github.com/sirupsen/logrus v1.7.0/go.mod"
	"github.com/sirupsen/logrus v1.9.3"
	"github.com/sirupsen/logrus v1.9.3/go.mod"
	"github.com/slackhq/nebula v1.6.1"
	"github.com/slackhq/nebula v1.6.1/go.mod"
	"github.com/smallstep/assert v0.0.0-20200723003110-82e2b9b3b262"
	"github.com/smallstep/assert v0.0.0-20200723003110-82e2b9b3b262/go.mod"
	"github.com/smallstep/certificates v0.26.1"
	"github.com/smallstep/certificates v0.26.1/go.mod"
	"github.com/smallstep/go-attestation v0.4.4-0.20240109183208-413678f90935"
	"github.com/smallstep/go-attestation v0.4.4-0.20240109183208-413678f90935/go.mod"
	"github.com/smallstep/nosql v0.6.1"
	"github.com/smallstep/nosql v0.6.1/go.mod"
	"github.com/smallstep/pkcs7 v0.0.0-20231024181729-3b98ecc1ca81"
	"github.com/smallstep/pkcs7 v0.0.0-20231024181729-3b98ecc1ca81/go.mod"
	"github.com/smallstep/scep v0.0.0-20231024192529-aee96d7ad34d"
	"github.com/smallstep/scep v0.0.0-20231024192529-aee96d7ad34d/go.mod"
	"github.com/smallstep/truststore v0.13.0"
	"github.com/smallstep/truststore v0.13.0/go.mod"
	"github.com/spaolacci/murmur3 v0.0.0-20180118202830-f09979ecbc72/go.mod"
	"github.com/spaolacci/murmur3 v1.1.0"
	"github.com/spaolacci/murmur3 v1.1.0/go.mod"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cast v1.3.1/go.mod"
	"github.com/spf13/cast v1.4.1"
	"github.com/spf13/cast v1.4.1/go.mod"
	"github.com/spf13/cobra v0.0.5/go.mod"
	"github.com/spf13/cobra v1.8.0"
	"github.com/spf13/cobra v1.8.0/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/spf13/viper v1.3.2/go.mod"
	"github.com/stoewer/go-strcase v1.2.0"
	"github.com/stoewer/go-strcase v1.2.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/objx v0.2.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.4/go.mod"
	"github.com/stretchr/testify v1.9.0"
	"github.com/stretchr/testify v1.9.0/go.mod"
	"github.com/tailscale/tscert v0.0.0-20240517230440-bbccfbf48933"
	"github.com/tailscale/tscert v0.0.0-20240517230440-bbccfbf48933/go.mod"
	"github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8/go.mod"
	"github.com/urfave/cli v1.22.14"
	"github.com/urfave/cli v1.22.14/go.mod"
	"github.com/x448/float16 v0.8.4"
	"github.com/x448/float16 v0.8.4/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"github.com/yuin/goldmark v1.4.15/go.mod"
	"github.com/yuin/goldmark v1.7.1"
	"github.com/yuin/goldmark v1.7.1/go.mod"
	"github.com/yuin/goldmark-highlighting/v2 v2.0.0-20230729083705-37449abec8cc"
	"github.com/yuin/goldmark-highlighting/v2 v2.0.0-20230729083705-37449abec8cc/go.mod"
	"github.com/zeebo/assert v1.1.0"
	"github.com/zeebo/assert v1.1.0/go.mod"
	"github.com/zeebo/blake3 v0.2.3"
	"github.com/zeebo/blake3 v0.2.3/go.mod"
	"github.com/zeebo/pcg v1.0.1"
	"github.com/zeebo/pcg v1.0.1/go.mod"
	"github.com/zenazn/goji v0.9.0/go.mod"
	"go.etcd.io/bbolt v1.3.9"
	"go.etcd.io/bbolt v1.3.9/go.mod"
	"go.opencensus.io v0.24.0"
	"go.opencensus.io v0.24.0/go.mod"
	"go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.49.0"
	"go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.49.0/go.mod"
	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.49.0"
	"go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.49.0/go.mod"
	"go.opentelemetry.io/contrib/propagators/autoprop v0.42.0"
	"go.opentelemetry.io/contrib/propagators/autoprop v0.42.0/go.mod"
	"go.opentelemetry.io/contrib/propagators/aws v1.17.0"
	"go.opentelemetry.io/contrib/propagators/aws v1.17.0/go.mod"
	"go.opentelemetry.io/contrib/propagators/b3 v1.17.0"
	"go.opentelemetry.io/contrib/propagators/b3 v1.17.0/go.mod"
	"go.opentelemetry.io/contrib/propagators/jaeger v1.17.0"
	"go.opentelemetry.io/contrib/propagators/jaeger v1.17.0/go.mod"
	"go.opentelemetry.io/contrib/propagators/ot v1.17.0"
	"go.opentelemetry.io/contrib/propagators/ot v1.17.0/go.mod"
	"go.opentelemetry.io/otel v1.24.0"
	"go.opentelemetry.io/otel v1.24.0/go.mod"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.21.0"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.21.0/go.mod"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.21.0"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.21.0/go.mod"
	"go.opentelemetry.io/otel/metric v1.24.0"
	"go.opentelemetry.io/otel/metric v1.24.0/go.mod"
	"go.opentelemetry.io/otel/sdk v1.21.0"
	"go.opentelemetry.io/otel/sdk v1.21.0/go.mod"
	"go.opentelemetry.io/otel/trace v1.24.0"
	"go.opentelemetry.io/otel/trace v1.24.0/go.mod"
	"go.opentelemetry.io/proto/otlp v1.0.0"
	"go.opentelemetry.io/proto/otlp v1.0.0/go.mod"
	"go.step.sm/cli-utils v0.9.0"
	"go.step.sm/cli-utils v0.9.0/go.mod"
	"go.step.sm/crypto v0.45.0"
	"go.step.sm/crypto v0.45.0/go.mod"
	"go.step.sm/linkedca v0.20.1"
	"go.step.sm/linkedca v0.20.1/go.mod"
	"go.uber.org/atomic v1.3.2/go.mod"
	"go.uber.org/atomic v1.4.0/go.mod"
	"go.uber.org/atomic v1.5.0/go.mod"
	"go.uber.org/atomic v1.6.0/go.mod"
	"go.uber.org/automaxprocs v1.5.3"
	"go.uber.org/automaxprocs v1.5.3/go.mod"
	"go.uber.org/goleak v1.3.0"
	"go.uber.org/goleak v1.3.0/go.mod"
	"go.uber.org/mock v0.4.0"
	"go.uber.org/mock v0.4.0/go.mod"
	"go.uber.org/multierr v1.1.0/go.mod"
	"go.uber.org/multierr v1.3.0/go.mod"
	"go.uber.org/multierr v1.5.0/go.mod"
	"go.uber.org/multierr v1.11.0"
	"go.uber.org/multierr v1.11.0/go.mod"
	"go.uber.org/tools v0.0.0-20190618225709-2cfd321de3ee/go.mod"
	"go.uber.org/zap v1.9.1/go.mod"
	"go.uber.org/zap v1.10.0/go.mod"
	"go.uber.org/zap v1.13.0/go.mod"
	"go.uber.org/zap v1.27.0"
	"go.uber.org/zap v1.27.0/go.mod"
	"go.uber.org/zap/exp v0.2.0"
	"go.uber.org/zap/exp v0.2.0/go.mod"
	"golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190411191339-88737f569e3a/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190820162420-60c769a6c586/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20201203163018-be400aefbc4c/go.mod"
	"golang.org/x/crypto v0.0.0-20210616213533-5ff15b29337e/go.mod"
	"golang.org/x/crypto v0.0.0-20210711020723-a769d52b0f97/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/crypto v0.3.0/go.mod"
	"golang.org/x/crypto v0.19.0/go.mod"
	"golang.org/x/crypto v0.23.0"
	"golang.org/x/crypto v0.23.0/go.mod"
	"golang.org/x/crypto/x509roots/fallback v0.0.0-20240507223354-67b13616a595"
	"golang.org/x/crypto/x509roots/fallback v0.0.0-20240507223354-67b13616a595/go.mod"
	"golang.org/x/exp v0.0.0-20240506185415-9bf2ced13842"
	"golang.org/x/exp v0.0.0-20240506185415-9bf2ced13842/go.mod"
	"golang.org/x/lint v0.0.0-20190930215403-16217165b5de/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/mod v0.8.0/go.mod"
	"golang.org/x/mod v0.17.0"
	"golang.org/x/mod v0.17.0/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190813141303-74dc4d7220e7/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.2.0/go.mod"
	"golang.org/x/net v0.6.0/go.mod"
	"golang.org/x/net v0.10.0/go.mod"
	"golang.org/x/net v0.25.0"
	"golang.org/x/net v0.25.0/go.mod"
	"golang.org/x/oauth2 v0.20.0"
	"golang.org/x/oauth2 v0.20.0/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.1.0/go.mod"
	"golang.org/x/sync v0.7.0"
	"golang.org/x/sync v0.7.0/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20181122145206-62eef0e2fa9b/go.mod"
	"golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190403152447-81d4e9dc473e/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190422165155-953cdadca894/go.mod"
	"golang.org/x/sys v0.0.0-20190626221950-04f50cda93cb/go.mod"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20220310020820-b874c991c1a5/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.2.0/go.mod"
	"golang.org/x/sys v0.5.0/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.8.0/go.mod"
	"golang.org/x/sys v0.17.0/go.mod"
	"golang.org/x/sys v0.20.0"
	"golang.org/x/sys v0.20.0/go.mod"
	"golang.org/x/term v0.0.0-20201117132131-f5c789dd3221/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/term v0.2.0/go.mod"
	"golang.org/x/term v0.5.0/go.mod"
	"golang.org/x/term v0.8.0/go.mod"
	"golang.org/x/term v0.17.0/go.mod"
	"golang.org/x/term v0.20.0"
	"golang.org/x/term v0.20.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.4/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.4.0/go.mod"
	"golang.org/x/text v0.7.0/go.mod"
	"golang.org/x/text v0.9.0/go.mod"
	"golang.org/x/text v0.14.0/go.mod"
	"golang.org/x/text v0.15.0"
	"golang.org/x/text v0.15.0/go.mod"
	"golang.org/x/time v0.5.0"
	"golang.org/x/time v0.5.0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190425163242-31fd60d6bfdc/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20190823170909-c4a336ef6a2f/go.mod"
	"golang.org/x/tools v0.0.0-20191029041327-9cc4af7d6b2c/go.mod"
	"golang.org/x/tools v0.0.0-20191029190741-b9c20aec41a5/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20200103221440-774c71fcf114/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/tools v0.6.0/go.mod"
	"golang.org/x/tools v0.21.0"
	"golang.org/x/tools v0.21.0/go.mod"
	"golang.org/x/xerrors v0.0.0-20190410155217-1f06c39b4373/go.mod"
	"golang.org/x/xerrors v0.0.0-20190513163551-3ee3066db522/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"google.golang.org/api v0.180.0"
	"google.golang.org/api v0.180.0/go.mod"
	"google.golang.org/genproto v0.0.0-20240401170217-c3f982113cda"
	"google.golang.org/genproto v0.0.0-20240401170217-c3f982113cda/go.mod"
	"google.golang.org/genproto/googleapis/api v0.0.0-20240506185236-b8a5c65736ae"
	"google.golang.org/genproto/googleapis/api v0.0.0-20240506185236-b8a5c65736ae/go.mod"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20240429193739-8cf5692501f6"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20240429193739-8cf5692501f6/go.mod"
	"google.golang.org/grpc v1.63.2"
	"google.golang.org/grpc v1.63.2/go.mod"
	"google.golang.org/protobuf v1.34.1"
	"google.golang.org/protobuf v1.34.1/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c"
	"gopkg.in/check.v1 v1.0.0-20201130134442-10cb98267c6c/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/inconshreveable/log15.v2 v2.0.0-20180818164646-67afb5ed74ec/go.mod"
	"gopkg.in/natefinch/lumberjack.v2 v2.2.1"
	"gopkg.in/natefinch/lumberjack.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v1 v1.0.0-20140924161607-9f9df34309c0/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"howett.net/plist v1.0.0"
	"howett.net/plist v1.0.0/go.mod"
)

go-module_set_globals

DESCRIPTION="Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS"
HOMEPAGE="https://caddyserver.com/ https://github.com/caddyserver/caddy"
SRC_URI="https://github.com/caddyserver/caddy/tarball/271d45ee451f7e336c7ab92c4a99185b21663721 -> caddy-2.8.2-271d45e.tar.gz
https://direct.funtoo.org/74/1c/ac/741cacca82e9fce526811ced77fe844fb3e48a2c7bf511b843d2cc0cc8aeda9ff6c569530ef202c9bf38d9bee4494a03cb6f2a74ccfbb3e5eff3ac87e7de01fb -> caddy-2.8.2-funtoo-go-bundle-0a5d19217eb977a1ed26e1236d19ad559e93c7dff6c4dd3ab40197f23d82b686c2c9fbbf9526b706c085f20ff356be4bc4a646bf42fd19f9f2bfba1b151936eb.tar.gz"

LICENSE="Apache-2.0 BSD ECL-2.0 MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

CADDY_USER="${PN}"
CADDY_HOME="/var/www/${CADDY_USER}"

pkg_setup() {
	enewgroup ${CADDY_USER}
	enewuser ${CADDY_USER} -1 -1 "${CADDY_HOME}" ${CADDY_USER}
}

post_src_unpack() {
	mv ${WORKDIR}/caddyserver-* ${S} || die
}

# Upstream reference to set custom compile time Caddy versions:
# https://github.com/caddyserver/caddy/pull/5072/files
src_compile() {
	go build -ldflags '-X github.com/caddyserver/caddy/v2.CustomVersion=v2.8.2-271d45e-funtoo' \
	-mod=mod ./cmd/caddy || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
	insinto /etc/"${PN}"
	doins "${FILESDIR}"/Caddyfile
	newconfd "${FILESDIR}/${PN}".confd ${PN}
	newinitd "${FILESDIR}/${PN}".initd ${PN}
	keepdir /var/log/"${PN}"
	keepdir /var/www/"${PN}"
	fowners "${CADDY_USER}:${CADDY_USER}" /var/log/"${PN}"
	fowners "${CADDY_USER}:${CADDY_USER}" /var/www/"${PN}"
	fperms 0750 /var/log/"${PN}"
	fperms 0750 /var/www/"${PN}"
}

pkg_postinst() {
	fcaps cap_net_bind_service=eip /usr/bin/caddy
}