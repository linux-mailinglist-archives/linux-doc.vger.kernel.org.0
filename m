Return-Path: <linux-doc+bounces-190-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E07C77E7
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 22:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F23C282850
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 20:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38753D960;
	Thu, 12 Oct 2023 20:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvySBYkn"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442073D96E
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 20:32:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814C4BE
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697142728; x=1728678728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+r98bVVhHlBANw0plXuZxHdZZFnh/4ZDpk9JtOI5BW0=;
  b=SvySBYknN6na+QPzfIfAnN+662svD0alYqY8uNkvtCtmWfci1adeEY7f
   +xQnJRnPu6KaawioWBXTwrq3KqGHiYfD50+9IUGKo/aTB6F7AD0z4dLAB
   Is0RFACZxoTcN9k4j4FXjrXUyZBenoToaAuHdmWgdSHsDkOmGukzSjezN
   cvXQBwdV3mw6XXuXzaaApGh9Y6SYPEs7rRUpHpbhxgQISEa/3A7khgjOi
   L0OFX3yaNLNcrn58YhflnBbj7JaGNsBnBzIWzk4DsX+AejJFQ46zw7ByX
   ENHSGRDZgN/3Tr+oROciKcOck0PBxa+ZQtrqxh1IzZ41XZAiWwJV79FKw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370103787"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370103787"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878231717"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878231717"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 13:32:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr2Lj-0003rD-1d;
	Thu, 12 Oct 2023 20:32:03 +0000
Date: Fri, 13 Oct 2023 04:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Pratyush Yadav <p.yadav@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:pr 135/144] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml
Message-ID: <202310130411.c66pTXjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

tree:   git://linuxtv.org/hverkuil/media_tree.git pr
head:   ab87cbf35518d16b5ae456336000ad3bf6ce8d06
commit: c0f6b7e76f997fbca6047eb1607ec1a32cf31a66 [135/144] media: ti: Add CSI2RX support for J721E
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130411.c66pTXjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130411.c66pTXjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

