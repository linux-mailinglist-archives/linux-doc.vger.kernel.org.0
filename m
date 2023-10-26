Return-Path: <linux-doc+bounces-1165-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3647D7AFA
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 04:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1AE5B21030
	for <lists+linux-doc@lfdr.de>; Thu, 26 Oct 2023 02:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACC8258F;
	Thu, 26 Oct 2023 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7/gniQA"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F415C4
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 02:37:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD37185
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 19:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698287875; x=1729823875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjPVDnZ+2ujEN1pFpOHWWqdhSiV29N9aw5sjx3PpyfI=;
  b=N7/gniQAqmz8TJZKgf9Q3CIMSiTOAFA0eU8Qo7jdinE8rSHPpTVbie0k
   u/978EiWNnpiLtN4yeHvUlGxXAY3FtEyeKAOxWbChhj34/z0RqFUCXMKn
   eirBYvxLPsrJawvFCIfEnSr9qMLsvLj1aAJu0qVLjdXBxxptiTsxZF9tX
   OzGoyqYXKiQAeszPlBhpXW+lrQNX9l77chNt2gaEm+DPNROyc+EQ0L1im
   KCZ2EWjp1h0NiDNUfx2ivxl8MBLSyPtW08/EmxIN0vCYI6IBJz5iG5z6I
   Zy1BGyDxJwiSimgYOL42TdZrCEerD6mK/ZxSMfruUSgDLtSQ1DH3iKEOU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391313793"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="391313793"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 19:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1090442953"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="1090442953"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2023 19:37:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvqFr-0009Oh-0m;
	Thu, 26 Oct 2023 02:37:51 +0000
Date: Thu, 26 Oct 2023 10:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 10651/14992] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/iio/imu/bosch,bma400.yaml
Message-ID: <202310261059.USL6VstF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe1998aa935b44ef873193c0772c43bce74f17dc
commit: b512c767e7bcef308ee5b038405debf9baa9c579 [10651/14992] iio: imu: Add driver for BMI323 IMU
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310261059.USL6VstF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261059.USL6VstF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/iio/imu/bosch,bma400.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

