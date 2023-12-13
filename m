Return-Path: <linux-doc+bounces-4819-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630FD80F4A0
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 18:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BA051C20B1D
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 17:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC0E7D89E;
	Tue, 12 Dec 2023 17:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkI0cphR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDAC8E
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 09:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702402323; x=1733938323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cfce93mNHkfWZR462dSsofXGjYS7vVs7PvP+WofDxiQ=;
  b=gkI0cphRyYkWrQ31XcOKrI+C148nO1Nw3LTNAW1vTSrloIfZ49dhXb9N
   udjymO04nb+m23Lq6lsbkydRzOaCHoZNSqa1yE4ga6x8TApXG01ea+Stb
   P3dRFIHyPoNDdBWOpIZkzubyn9gXMKngxVa7OgRsM//+4oYGxYLaN/g+y
   N8483gzzpDZhcRfdYxm/nlmg6onCkWG1OQbttSF/asHVwcWXWrdpnn7EH
   de5XoYWYyvArCbBCf7DN/e+iFGBZcKVw4ySZf0MKjh6R8L/8AnWgtS0Iu
   RqZKApcaJ5ut93204i9LURFNE5DIbzmbzJu1FLbSgaMoBQWjcPh+twr55
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8211560"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="8211560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 09:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="15096224"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2023 09:32:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD6bt-000JUF-39;
	Tue, 12 Dec 2023 17:31:57 +0000
Date: Wed, 13 Dec 2023 01:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 6213/6946] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
Message-ID: <202312130153.eBbUNFQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abb240f7a2bd14567ab53e602db562bb683391e6
commit: 2e87bad7cd339882cf26b7101a1c87dab71962c9 [6213/6946] drm/panel: Add Synaptics R63353 panel driver
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130153.eBbUNFQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130153.eBbUNFQa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

