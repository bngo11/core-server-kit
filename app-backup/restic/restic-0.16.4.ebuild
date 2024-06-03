# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module bash-completion-r1

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.110.9"
	"cloud.google.com/go v0.110.9/go.mod"
	"cloud.google.com/go/compute v1.23.1"
	"cloud.google.com/go/compute v1.23.1/go.mod"
	"cloud.google.com/go/compute/metadata v0.2.3"
	"cloud.google.com/go/compute/metadata v0.2.3/go.mod"
	"cloud.google.com/go/iam v1.1.3"
	"cloud.google.com/go/iam v1.1.3/go.mod"
	"cloud.google.com/go/storage v1.34.0"
	"cloud.google.com/go/storage v1.34.0/go.mod"
	"github.com/!azure/azure-sdk-for-go/sdk/azcore v1.9.1"
	"github.com/!azure/azure-sdk-for-go/sdk/azcore v1.9.1/go.mod"
	"github.com/!azure/azure-sdk-for-go/sdk/azidentity v1.4.0"
	"github.com/!azure/azure-sdk-for-go/sdk/azidentity v1.4.0/go.mod"
	"github.com/!azure/azure-sdk-for-go/sdk/internal v1.5.1"
	"github.com/!azure/azure-sdk-for-go/sdk/internal v1.5.1/go.mod"
	"github.com/!azure/azure-sdk-for-go/sdk/resourcemanager/storage/armstorage v1.2.0"
	"github.com/!azure/azure-sdk-for-go/sdk/storage/azblob v1.2.0"
	"github.com/!azure/azure-sdk-for-go/sdk/storage/azblob v1.2.0/go.mod"
	"github.com/!azure!a!d/microsoft-authentication-library-for-go v1.2.0"
	"github.com/!azure!a!d/microsoft-authentication-library-for-go v1.2.0/go.mod"
	"github.com/!backblaze/blazer v0.6.1"
	"github.com/!backblaze/blazer v0.6.1/go.mod"
	"github.com/!burnt!sushi/toml v0.3.1/go.mod"
	"github.com/!julusian/godocdown v0.0.0-20170816220326-6d19f8ff2df8/go.mod"
	"github.com/anacrolix/fuse v0.2.0"
	"github.com/anacrolix/fuse v0.2.0/go.mod"
	"github.com/cenkalti/backoff/v4 v4.2.1"
	"github.com/cenkalti/backoff/v4 v4.2.1/go.mod"
	"github.com/census-instrumentation/opencensus-proto v0.2.1/go.mod"
	"github.com/cespare/xxhash/v2 v2.2.0"
	"github.com/cespare/xxhash/v2 v2.2.0/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/cncf/udpa/go v0.0.0-20191209042840-269d4d468f6f/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.2/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.3"
	"github.com/cpuguy83/go-md2man/v2 v2.0.3/go.mod"
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dnaeon/go-vcr v1.2.0"
	"github.com/dustin/go-humanize v1.0.1"
	"github.com/dustin/go-humanize v1.0.1/go.mod"
	"github.com/dvyukov/go-fuzz v0.0.0-20200318091601-be3528f3a813/go.mod"
	"github.com/elazarl/go-bindata-assetfs v1.0.0/go.mod"
	"github.com/elithrar/simple-scrypt v1.3.0"
	"github.com/elithrar/simple-scrypt v1.3.0/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.0/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.1-0.20191026205805-5f8ba28d4473/go.mod"
	"github.com/envoyproxy/go-control-plane v0.9.4/go.mod"
	"github.com/envoyproxy/protoc-gen-validate v0.1.0/go.mod"
	"github.com/felixge/fgprof v0.9.3"
	"github.com/felixge/fgprof v0.9.3/go.mod"
	"github.com/go-ole/go-ole v1.3.0"
	"github.com/go-ole/go-ole v1.3.0/go.mod"
	"github.com/golang-jwt/jwt/v5 v5.0.0"
	"github.com/golang-jwt/jwt/v5 v5.0.0/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e/go.mod"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da"
	"github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.1.0.20200221234624-67d41d38c208/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.2/go.mod"
	"github.com/golang/protobuf v1.4.0-rc.4.0.20200313231945-b860323f09d0/go.mod"
	"github.com/golang/protobuf v1.4.0/go.mod"
	"github.com/golang/protobuf v1.4.1/go.mod"
	"github.com/golang/protobuf v1.4.3/go.mod"
	"github.com/golang/protobuf v1.5.0/go.mod"
	"github.com/golang/protobuf v1.5.2/go.mod"
	"github.com/golang/protobuf v1.5.3"
	"github.com/golang/protobuf v1.5.3/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-cmp v0.5.0/go.mod"
	"github.com/google/go-cmp v0.5.3/go.mod"
	"github.com/google/go-cmp v0.5.5/go.mod"
	"github.com/google/go-cmp v0.6.0"
	"github.com/google/go-cmp v0.6.0/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/martian/v3 v3.3.2"
	"github.com/google/pprof v0.0.0-20211214055906-6f57359322fd/go.mod"
	"github.com/google/pprof v0.0.0-20230926050212-f7f687d19a98"
	"github.com/google/pprof v0.0.0-20230926050212-f7f687d19a98/go.mod"
	"github.com/google/s2a-go v0.1.7"
	"github.com/google/s2a-go v0.1.7/go.mod"
	"github.com/google/uuid v1.1.2/go.mod"
	"github.com/google/uuid v1.5.0"
	"github.com/google/uuid v1.5.0/go.mod"
	"github.com/googleapis/enterprise-certificate-proxy v0.3.2"
	"github.com/googleapis/enterprise-certificate-proxy v0.3.2/go.mod"
	"github.com/googleapis/gax-go/v2 v2.12.0"
	"github.com/googleapis/gax-go/v2 v2.12.0/go.mod"
	"github.com/hashicorp/golang-lru/v2 v2.0.7"
	"github.com/hashicorp/golang-lru/v2 v2.0.7/go.mod"
	"github.com/ianlancetaylor/demangle v0.0.0-20210905161508-09a460cdf81d/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/json-iterator/go v1.1.12"
	"github.com/json-iterator/go v1.1.12/go.mod"
	"github.com/klauspost/compress v1.17.2"
	"github.com/klauspost/compress v1.17.2/go.mod"
	"github.com/klauspost/cpuid/v2 v2.0.1/go.mod"
	"github.com/klauspost/cpuid/v2 v2.2.6"
	"github.com/klauspost/cpuid/v2 v2.2.6/go.mod"
	"github.com/kr/fs v0.1.0"
	"github.com/kr/fs v0.1.0/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/kylelemons/godebug v1.1.0"
	"github.com/kylelemons/godebug v1.1.0/go.mod"
	"github.com/minio/md5-simd v1.1.2"
	"github.com/minio/md5-simd v1.1.2/go.mod"
	"github.com/minio/minio-go/v7 v7.0.66"
	"github.com/minio/minio-go/v7 v7.0.66/go.mod"
	"github.com/minio/sha256-simd v1.0.1"
	"github.com/minio/sha256-simd v1.0.1/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v1.0.2"
	"github.com/modern-go/reflect2 v1.0.2/go.mod"
	"github.com/ncw/swift/v2 v2.0.2"
	"github.com/ncw/swift/v2 v2.0.2/go.mod"
	"github.com/pkg/browser v0.0.0-20210911075715-681adbf594b8"
	"github.com/pkg/browser v0.0.0-20210911075715-681adbf594b8/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pkg/profile v1.7.0"
	"github.com/pkg/profile v1.7.0/go.mod"
	"github.com/pkg/sftp v1.13.6"
	"github.com/pkg/sftp v1.13.6/go.mod"
	"github.com/pkg/xattr v0.4.10-0.20221120235825-35026bbbd013"
	"github.com/pkg/xattr v0.4.10-0.20221120235825-35026bbbd013/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/prashantv/gostub v1.1.0"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/restic/chunker v0.4.0"
	"github.com/restic/chunker v0.4.0/go.mod"
	"github.com/robertkrimen/godocdown v0.0.0-20130622164427-0bfa04905481/go.mod"
	"github.com/rs/xid v1.5.0"
	"github.com/rs/xid v1.5.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/sirupsen/logrus v1.9.3"
	"github.com/sirupsen/logrus v1.9.3/go.mod"
	"github.com/spf13/cobra v1.7.0"
	"github.com/spf13/cobra v1.7.0/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stephens2424/writerset v1.0.2/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.4.0/go.mod"
	"github.com/stretchr/objx v0.5.0/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/stretchr/testify v1.7.1/go.mod"
	"github.com/stretchr/testify v1.8.0/go.mod"
	"github.com/stretchr/testify v1.8.1/go.mod"
	"github.com/stretchr/testify v1.8.4"
	"github.com/tv42/httpunix v0.0.0-20191220191345-2ba4b9c3382c"
	"github.com/tv42/httpunix v0.0.0-20191220191345-2ba4b9c3382c/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"github.com/yuin/goldmark v1.4.13/go.mod"
	"go.opencensus.io v0.24.0"
	"go.opencensus.io v0.24.0/go.mod"
	"go.uber.org/automaxprocs v1.5.3"
	"go.uber.org/automaxprocs v1.5.3/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/crypto v0.0.0-20210921155107-089bfa567519/go.mod"
	"golang.org/x/crypto v0.1.0/go.mod"
	"golang.org/x/crypto v0.17.0"
	"golang.org/x/crypto v0.17.0/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/net v0.0.0-20201110031124-69a78807bb2b/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20220722155237-a158d28d115b/go.mod"
	"golang.org/x/net v0.1.0/go.mod"
	"golang.org/x/net v0.19.0"
	"golang.org/x/net v0.19.0/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.15.0"
	"golang.org/x/oauth2 v0.15.0/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sync v0.0.0-20220722155255-886fb9371eb4/go.mod"
	"golang.org/x/sync v0.5.0"
	"golang.org/x/sync v0.5.0/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20191210023423-ac6580df4449/go.mod"
	"golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210616045830-e2b7044e8c71/go.mod"
	"golang.org/x/sys v0.0.0-20211007075335-d3039528d8ac/go.mod"
	"golang.org/x/sys v0.0.0-20220408201424-a24fb2fb8a0f/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
	"golang.org/x/sys v0.0.0-20220722155257-8c9f86f7a55f/go.mod"
	"golang.org/x/sys v0.1.0/go.mod"
	"golang.org/x/sys v0.5.0/go.mod"
	"golang.org/x/sys v0.15.0"
	"golang.org/x/sys v0.15.0/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod"
	"golang.org/x/term v0.1.0/go.mod"
	"golang.org/x/term v0.15.0"
	"golang.org/x/term v0.15.0/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/text v0.3.8/go.mod"
	"golang.org/x/text v0.4.0/go.mod"
	"golang.org/x/text v0.14.0"
	"golang.org/x/text v0.14.0/go.mod"
	"golang.org/x/time v0.5.0"
	"golang.org/x/time v0.5.0/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20200423201157-2723c5de0d66/go.mod"
	"golang.org/x/tools v0.1.12/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"golang.org/x/xerrors v0.0.0-20231012003039-104605ab7028"
	"golang.org/x/xerrors v0.0.0-20231012003039-104605ab7028/go.mod"
	"google.golang.org/api v0.149.0"
	"google.golang.org/api v0.149.0/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.6.8"
	"google.golang.org/appengine v1.6.8/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20200526211855-cb27e3aa2013/go.mod"
	"google.golang.org/genproto v0.0.0-20231016165738-49dd2c1f3d0b"
	"google.golang.org/genproto v0.0.0-20231016165738-49dd2c1f3d0b/go.mod"
	"google.golang.org/genproto/googleapis/api v0.0.0-20231016165738-49dd2c1f3d0b"
	"google.golang.org/genproto/googleapis/api v0.0.0-20231016165738-49dd2c1f3d0b/go.mod"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20231016165738-49dd2c1f3d0b"
	"google.golang.org/genproto/googleapis/rpc v0.0.0-20231016165738-49dd2c1f3d0b/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.23.0/go.mod"
	"google.golang.org/grpc v1.25.1/go.mod"
	"google.golang.org/grpc v1.27.0/go.mod"
	"google.golang.org/grpc v1.33.2/go.mod"
	"google.golang.org/grpc v1.59.0"
	"google.golang.org/grpc v1.59.0/go.mod"
	"google.golang.org/protobuf v0.0.0-20200109180630-ec00e32a8dfd/go.mod"
	"google.golang.org/protobuf v0.0.0-20200221191635-4d8936d0db64/go.mod"
	"google.golang.org/protobuf v0.0.0-20200228230310-ab0ca4ff8a60/go.mod"
	"google.golang.org/protobuf v1.20.1-0.20200309200217-e05f789c0967/go.mod"
	"google.golang.org/protobuf v1.21.0/go.mod"
	"google.golang.org/protobuf v1.22.0/go.mod"
	"google.golang.org/protobuf v1.23.0/go.mod"
	"google.golang.org/protobuf v1.23.1-0.20200526195155-81db48ad09cc/go.mod"
	"google.golang.org/protobuf v1.25.0/go.mod"
	"google.golang.org/protobuf v1.26.0-rc.1/go.mod"
	"google.golang.org/protobuf v1.26.0/go.mod"
	"google.golang.org/protobuf v1.31.0"
	"google.golang.org/protobuf v1.31.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/ini.v1 v1.67.0"
	"gopkg.in/ini.v1 v1.67.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
)

DESCRIPTION="A backup program that is fast, efficient and secure"
HOMEPAGE="https://restic.github.io/"
SRC_URI="https://github.com/restic/restic/tarball/9a9cc6dd0d978a8a452ff181558d5856dc217a37 -> restic-0.16.4-9a9cc6d.tar.gz
https://direct.funtoo.org/8b/7e/a1/8b7ea18a7fce41ab135f8a85c30bf450dc0ac854148870dfdeeb8c64eef1b3d76680300d39d127a27f9057cfafd7d538ad5e4b2923d562a3cadc985eee4b23eb -> restic-0.16.4-funtoo-go-bundle-ae47dba26aafe7203e2127296462d8064105080fa26f8bc079932e59fc1665c6d55985d521393389d03ac6315a02137d97535e4567568a5dda577852b91a5774.tar.gz"

LICENSE="Apache-2.0 BSD BSD-2 LGPL-3-with-linking-exception MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND="sys-fs/fuse:0"
DEPEND="${RDEPEND}"

post_src_unpack() {
	mv ${WORKDIR}/restic-* ${S}
}

src_compile() {
	go build -ldflags '-X main.version=0.16.4' \
		-asmflags "-trimpath=${S}" \
		-gcflags "-trimpath=${S}" \
		-o restic ./cmd/restic
}

src_install() {
	dobin restic

	newbashcomp doc/bash-completion.sh "${PN}"

	insinto /usr/share/zsh/site-functions
	newins doc/zsh-completion.zsh _restic

	insinto /usr/share/fish/vendor_completions.d/
	newins doc/fish-completion.fish "${PN}"

	doman doc/man/*
	dodoc doc/*.rst
}