class ApacheSparkAT245 < Formula
    desc "Engine for large-scale data processing"
    homepage "https://spark.apache.org/"
    url "https://www.apache.org/dyn/closer.lua/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz"
    mirror "https://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz"
    version "2.4.5"
    sha256 "020be52524e4df366eb974d41a6e18fcb6efcaba9a51632169e917c74267dd81"
    head "https://github.com/apache/spark.git"
  
    bottle :unneeded
  
    depends_on "openjdk@11"
  
    def install
      # Rename beeline to distinguish it from hive's beeline
      mv "bin/beeline", "bin/spark-beeline"
  
      rm_f Dir["bin/*.cmd"]
      libexec.install Dir["*"]
      bin.install Dir[libexec/"bin/*"]
    end
  
    test do
      assert_match "Long = 1000",
        pipe_output(bin/"spark-shell",
                    "sc.parallelize(1 to 1000).count()")
    end
  end