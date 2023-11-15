Return-Path: <linux-doc+bounces-2055-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E99877E683A
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 11:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66911C20A2C
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 10:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F55419444;
	Thu,  9 Nov 2023 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+XtQeFI"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DB8199B5
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 10:35:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B501FEA
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 02:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699526111; x=1731062111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIu8VEf+VpVaztR56QN2O09dTEcB/zZJA7taLxSN6/I=;
  b=h+XtQeFIgAaeWZMculyjDyNqLipmXMtXfGAD1yDYSmIxgJgHsxtFPPMf
   N8yBoq8B21svtJeFVxMbFZ+y1B2z3XrCuGkRkj8cYLoLP2saZS+CyJmHL
   Snof74l4br3nBjVq+2FhzPWtvpsCA/Qyy2LE5xAtimA0/y5qCzeczdgA+
   ose1YEHsF+IqQW3GM3treCRNlnAgrd2wk7Bg1pp+9x9jy+Y2YF4Fsiqsz
   jkMPu9HubzU3yBKKEQxTwFiFDWP75MS5j/6+cICj1u2lQtxkVRB8VLvUU
   1I/ZCDWvxNnxrBmuBo1qsrcHkvtdbjXg30piiQIRXRGax8pfp3ISTREdO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454263088"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="454263088"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 02:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="766956166"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="766956166"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2023 02:35:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r12NO-0008f6-3D;
	Thu, 09 Nov 2023 10:35:07 +0000
Date: Thu, 9 Nov 2023 18:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Lyude Paul <lyude@redhat.com>,
	linux-doc@vger.kernel.org
Subject: [drm-drm-intel:drm-intel-next 4/30] htmldocs:
 Documentation/gpu/drm-kms-helpers:296:
 ./drivers/gpu/drm/display/drm_dp_mst_topology.c:5473: WARNING: Unexpected
 indentation.
Message-ID: <202311091846.yDKRUR0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-intel drm-intel-next
head:   65c02404380fb328e4d1fe40318ac6de0e63327a
commit: 1cd0a5ea427931016c3e95b20dc20f17604937cc [4/30] drm/dp_mst: Factor out a helper to check the atomic state of a topology manager
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311091846.yDKRUR0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091846.yDKRUR0S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-kms-helpers:296: ./drivers/gpu/drm/display/drm_dp_mst_topology.c:5473: WARNING: Unexpected indentation.
>> Documentation/gpu/drm-kms-helpers:296: ./drivers/gpu/drm/display/drm_dp_mst_topology.c:5475: WARNING: Block quote ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

