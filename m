Return-Path: <linux-doc+bounces-8554-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D20A84C4BB
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 07:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B9A286099
	for <lists+linux-doc@lfdr.de>; Wed,  7 Feb 2024 06:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4BC1CD22;
	Wed,  7 Feb 2024 06:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRLhPJ/O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE4200A4;
	Wed,  7 Feb 2024 06:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707286171; cv=none; b=Lysa1XLIiwRxljqSsDEgFTUXBD0k1k+3aucmJW5Q11qOMjwcdjSZFIiDjBLSz4aMD+oLEVykuOiB5S2aXxLrZISuCfGDWBo/3DyR5ke/omX3umwlzqR6sLPoPzKXzb0CIbuMqNsD/lw0mxz6s+CueeyKbDfxcPbxFtpH0AHOGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707286171; c=relaxed/simple;
	bh=gErqH5iZ2fUCryD2fkCZUAp/vYOS2rcIZgcdaSpVZdg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ys4YoeaOaOrvqQcgqmmCQkcC2Z5apZwdiB7WADClzgXQ6DDKSn2A4DjfvDpvHKZQTbIF9Z5fkrS9Dkwxzp7nlfes2CAIHS8njg2F7JiuCLbgrlfbwU++vmOazkk4BgvmJ5tPnQUh7Cnl+GCoD1rN4ekszzNG363+Ny0dyPCAwIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRLhPJ/O; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707286169; x=1738822169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gErqH5iZ2fUCryD2fkCZUAp/vYOS2rcIZgcdaSpVZdg=;
  b=cRLhPJ/OeA2sWjLKX0unCS2ZbzKp8NegeOQ98B+B3pvz6Ly77Il9wNRg
   XYt9zT4M/n/1YIiiX4aRKxz6zh1Pogr8W5hiGdrQAd7vJGwQiz5EP9crj
   3D5oD8N5IeHEoGx2zHW5KnN95HGc6s2juJx8+qgUQ3bMoi2v8CtqgHmGl
   gIeI2VfWM6ndP3vd2+1bb9JsYuX1SC8wgL+fPym+D7JX43trXpogju6pw
   Cx2pIRCMHNNFNjmLYszUZvprrHgJgtwf1pw60LOXRzCniY8nYX9OxfGxE
   92oKfLDIyHjmEKYG272/X30WdMbxj98ZhbPfa5pUKRHTQGSxZk+CAMRQx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436053987"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="436053987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 22:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5849766"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2024 22:09:22 -0800
From: lakshmi.sowjanya.d@intel.com
To: tglx@linutronix.de,
	jstultz@google.com,
	giometti@enneenne.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	andriy.shevchenko@linux.intel.com,
	eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	jesse.brandeburg@intel.com,
	davem@davemloft.net,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	anthony.l.nguyen@intel.com,
	peter.hilber@opensynergy.com,
	pandith.n@intel.com,
	mallikarjunappa.sangannavar@intel.com,
	subramanian.mohan@intel.com,
	thejesh.reddy.t.r@intel.com,
	lakshmi.sowjanya.d@intel.com
Subject: [PATCH v4 04/11] igc: remove convert_art_to_tsc()
Date: Wed,  7 Feb 2024 11:38:47 +0530
Message-Id: <20240207060854.6524-5-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207060854.6524-1-lakshmi.sowjanya.d@intel.com>
References: <20240207060854.6524-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

Remove convert_art_to_tsc() function call, Pass system clock cycles and
clocksource ID as input to get_device_system_crosststamp().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_ptp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_ptp.c b/drivers/net/ethernet/intel/igc/igc_ptp.c
index 885faaa7b9de..0f568fc4b902 100644
--- a/drivers/net/ethernet/intel/igc/igc_ptp.c
+++ b/drivers/net/ethernet/intel/igc/igc_ptp.c
@@ -901,7 +901,11 @@ static bool igc_is_crosststamp_supported(struct igc_adapter *adapter)
 static struct system_counterval_t igc_device_tstamp_to_system(u64 tstamp)
 {
 #if IS_ENABLED(CONFIG_X86_TSC) && !defined(CONFIG_UML)
-	return convert_art_ns_to_tsc(tstamp);
+	return (struct system_counterval_t) {
+		.cs_id	= CSID_X86_ART,
+		.cycles	= tstamp,
+		.nsecs	= true,
+	};
 #else
 	return (struct system_counterval_t) { };
 #endif
-- 
2.35.3


