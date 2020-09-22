Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F09E2740B6
	for <lists+linux-doc@lfdr.de>; Tue, 22 Sep 2020 13:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgIVLW7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Sep 2020 07:22:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:42080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbgIVLW7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 22 Sep 2020 07:22:59 -0400
Received: from mail.kernel.org (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29EA2221EB;
        Tue, 22 Sep 2020 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600773778;
        bh=7ZXF3P5p4MjWkObrbAOtTL+8XlJ9hHimuQqgAGSiEFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q1ofZb5ASH33joYWlbHBuDEUjnlTJvpB7fbcoYfC/QqYaQ8TszcWO/wVcYAlGxdga
         jA4d+kOVzftGKBpESkX9oiv0Anyz0DdxPgtt5U/t9zrBnEZo+676ctRzrsOMvjNknu
         EsiuxKsNv3n1oY3t2X3nwFCw0jRbWvTfmOr/V7UA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKgNr-0010Ki-Ms; Tue, 22 Sep 2020 13:22:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/dp: fix kernel-doc warnings at drm_dp_helper.c
Date:   Tue, 22 Sep 2020 13:22:53 +0200
Message-Id: <df69c8404398af4487050a97534a134529e9ba56.1600773619.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600773619.git.mchehab+huawei@kernel.org>
References: <cover.1600773619.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As warned by kernel-doc:

	./drivers/gpu/drm/drm_dp_helper.c:385: warning: Function parameter or member 'type' not described in 'drm_dp_downstream_is_type'
	./drivers/gpu/drm/drm_dp_helper.c:886: warning: Function parameter or member 'dev' not described in 'drm_dp_downstream_mode'

Some function parameters weren't documented.

Fixes: 38784f6f8805 ("drm/dp: Add helpers to identify downstream facing port types")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index b1c71af88579..deeed73f4ed6 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -374,6 +374,10 @@ static bool is_edid_digital_input_dp(const struct edid *edid)
  * drm_dp_downstream_is_type() - is the downstream facing port of certain type?
  * @dpcd: DisplayPort configuration data
  * @port_cap: port capabilities
+ * @type: port type to be checked. Can be:
+ * 	  %DP_DS_PORT_TYPE_DP, %DP_DS_PORT_TYPE_VGA, %DP_DS_PORT_TYPE_DVI,
+ * 	  %DP_DS_PORT_TYPE_HDMI, %DP_DS_PORT_TYPE_NON_EDID,
+ *	  %DP_DS_PORT_TYPE_DP_DUALMODE or %DP_DS_PORT_TYPE_WIRELESS.
  *
  * Caveat: Only works with DPCD 1.1+ port caps.
  *
@@ -870,6 +874,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
 
 /**
  * drm_dp_downstream_mode() - return a mode for downstream facing port
+ * @dev: DRM device
  * @dpcd: DisplayPort configuration data
  * @port_cap: port capabilities
  *
-- 
2.26.2

