Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76621102FFA
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 00:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfKSXTh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 18:19:37 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38113 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbfKSXTg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 18:19:36 -0500
Received: by mail-wm1-f68.google.com with SMTP id z19so5806763wmk.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Yv901JXCZKepPNb0ar0BUnWjRmLSWkOuwXeWlenYz+g=;
        b=aS47yCywZ0yEX+8wij98lM5dhxsoxYagzC7/SuPpk+VqdW0DxbIKnoISZ9Ncy734Mc
         KSchZvwuuUORjQQkuv+1yn9JwMEWWqvshwdrPYKm7XDcIF2hld3CfIWPZyZ6WXLUIhY5
         MZEUyupCLfMfywetMPJgdZuDh1WHeZQD3HeTC4V4vn/4b1OaZdkxVUkDqIFjS4UfQuyY
         tG5Gk5/guKzOeuHCgIVpx4Mz1dg8UoqlQJleOuPBkpYQTHgr/OoVwrTllLbVxoiNqkZg
         FH0igUkC76tZU4RJYAjM1wApMJStuoNkibbHW3BbDcU8+xYL0z8ta4M3P7MobyIWutMy
         8Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Yv901JXCZKepPNb0ar0BUnWjRmLSWkOuwXeWlenYz+g=;
        b=s915P5Qycd/TeePHUXhTFdqza/3TUMathGjtDBsE8HDdcyC+Xmo9myfmeklvB5YCPc
         QQSgsPLqAjfweVILoOb51+chbn8aTRyKmNTfJWtAqgYun2b+4BtJEKa3uwfLHNIbRFb5
         T71470BChGUW2SXx8854TlPVIi+AGKZ2MOI3gIyH+QtSAzKvzEAu/tOPoCwavRYYZREI
         MYIHpkhkAMUHDA/zONhlTSgWvjQgtXjhbsi7WY8cQYvSTd+4eXOu6Srfy/7rpGCgX3ca
         aXSrlKATx8Yvs2t13FLX27VNtLBkjuCwD5T9h5/N/j/nvzuJ2UBT8D9g4pb56qYu8JNT
         IWQg==
X-Gm-Message-State: APjAAAU1wij9584B+ZJZNV3zvRv0HsYip/l+sQDO8vL+vZj5snEH/v6a
        gLsB5jo6vgZnC1Ol8RfeCV3S4g==
X-Google-Smtp-Source: APXvYqzSDyfD3vKtj2shweM8dfoDtDxP7zvdOlvTPXRIrhzyIpVN1xVy9jNbgLbXY08cAHNkpIcffg==
X-Received: by 2002:a1c:2395:: with SMTP id j143mr362829wmj.128.1574205574013;
        Tue, 19 Nov 2019 15:19:34 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a19d:4139:292b:19a0])
        by smtp.gmail.com with ESMTPSA id m15sm15746717wrj.52.2019.11.19.15.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:19:33 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Subject: [PATCH v5 14/14] docs: sysfs: coresight: Add sysfs ABI documentation for CTI
Date:   Tue, 19 Nov 2019 23:19:12 +0000
Message-Id: <20191119231912.12768-15-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119231912.12768-1-mike.leach@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add API usage document for sysfs API in CTI driver.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-cti   | 221 ++++++++++++++++++
 1 file changed, 221 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-cti

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
new file mode 100644
index 000000000000..d867800f567f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -0,0 +1,221 @@
+What:		/sys/bus/coresight/devices/<cti-name>/enable
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable/Disable the CTI hardware.
+
+What:		/sys/bus/coresight/devices/<cti-name>/ctmid
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Display the associated CTM ID
+
+What:		/sys/bus/coresight/devices/<cti-name>/nr_trigger_cons
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Number of devices connected to triggers on this CTI
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/name
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Name of connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_signals
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Input trigger signals from connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_types
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Functional types for the input trigger signals
+		from connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_signals
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Output trigger signals to connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_types
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Functional types for the output trigger signals
+		to connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/inout_sel
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Select the index for inen and outen registers.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/inen
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write the CTIINEN register selected by inout_sel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/outen
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write the CTIOUTEN register selected by inout_sel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/gate
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write CTIGATE register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/asicctl
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write ASICCTL register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/intack
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write the INTACK register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/appset
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Set CTIAPPSET register to activate channel. Read back to
+		determine current value of register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/appclear
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write APPCLEAR register to deactivate channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/apppulse
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write APPPULSE to pulse a channel active for one clock
+		cycle.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/chinstatus
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Read current status of channel inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/choutstatus
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of channel outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/triginstatus
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of input trigger signals
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of output trigger signals.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Attach a CTI input trigger to a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_detach
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Detach a CTI input trigger from a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_attach
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Attach a CTI output trigger to a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_detach
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Detach a CTI output trigger from a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_enable
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable CTIGATE for single channel (W) or list enabled
+		channels through the gate (R).
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_disable
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Disable CTIGATE for single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_set
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Activate a single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_clear
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Deactivate a single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_pulse
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Pulse a single channel - activate for a single clock cycle.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_filtered
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) List of output triggers filtered across all connections.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trig_filter_enable
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable or disable trigger output signal filtering.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_inuse
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) show channels with at least one attached trigger signal.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_free
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) show channels with no attached trigger signals.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_view
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Write channel number to select a channel to view, read to
+		see triggers attached to selected channel on this CTI.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_reset
+Date:		Jul 2019
+KernelVersion	5.4
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Clear all channel / trigger programming.
-- 
2.17.1

