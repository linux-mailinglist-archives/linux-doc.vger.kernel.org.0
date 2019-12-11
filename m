Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F3B11C063
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2019 00:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfLKXKY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Dec 2019 18:10:24 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42108 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLKXKY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 18:10:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id q6so500112wro.9
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 15:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=K/OQ1Jgex7gK828pBxgz7p1Ugpl7TPPOgqjJJN6erjc=;
        b=p2xub6V5d0HwDx9AtJt8B/VnFwtCprwrjWhVyJLXmPDkb8p0RBJiDwfAxXFqhfTWY/
         ioSrG8MtTPf/MaPSuNRWoZCN2lmSHUkzmDu1OmXIKk56A/bk0NjwwYF4FGKDOHk590sR
         GdoUqwN6FTG3UBRkxN9eUyYmIzCzCQzA2toNugJHl8QlEn3FrvQ9s4lSuPmm6MpFiEFi
         TqgN7FwepYGwBUwj0rnBmzG6huubXBUJyvNb5g4MWamFg7PkTceVdij1soACez2ijNuX
         //2SW+UzS3PMoxlbtO5J2hUw9b/uS9Dwa7uPG+1UCGEaHyY+fMWbFOPP/xKZivWSNo7n
         XaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=K/OQ1Jgex7gK828pBxgz7p1Ugpl7TPPOgqjJJN6erjc=;
        b=dB8thcASPOYFU3c2Te5uh95yd40UtDYXAi4wjkgD2Jcw3Ac7wYcThBeRt1f7maXcoN
         N6zNtPdR9eOS1XgYx1sJdDhMjAD9jBVDr/km4+oQkJjeKPJSjAE/vN0gk8JgU0Uvy5At
         xVfVBpDdg2pVnbJWdwZo6t/rr+c7t+f5otbOI6KTpejfJcTmR2bU55hqNKWOdRXi/8jy
         mnAefmuN20wjAqNIZ5pbB/PPq6Vc5biBXnoJXBoFRAi0Tk5OCNnF6x93SsrJapz+X/Pr
         +SPHCSeM/PivpJOHEnNdJTTDJr8Q0ed6HsVoPNk9d42OQ7t8S+gaYtDsbHUS2q6p1jFb
         kCgg==
X-Gm-Message-State: APjAAAXYnoyjBM/odykN7hBnbflBdOsbJEjI/PVbI2QXRhAUdzAhOObr
        2CoSWh2UrnQWk6J2fErpoXlt3Q==
X-Google-Smtp-Source: APXvYqy9motU4hDfKLRzWWMC0bjjkzFj3OuqE7x+CkEeOFSMXFgCENuClUOiRPmnaOuHGZYWb19lFw==
X-Received: by 2002:adf:f847:: with SMTP id d7mr2591565wrq.35.1576105820794;
        Wed, 11 Dec 2019 15:10:20 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:140f:3f8d:647c:49b0])
        by smtp.gmail.com with ESMTPSA id f16sm4042806wrm.65.2019.12.11.15.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 15:10:20 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v6 14/15] docs: sysfs: coresight: Add sysfs ABI documentation for CTI
Date:   Wed, 11 Dec 2019 23:10:14 +0000
Message-Id: <20191211231014.5634-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
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
index 000000000000..5ed54d196a17
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -0,0 +1,221 @@
+What:		/sys/bus/coresight/devices/<cti-name>/enable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable/Disable the CTI hardware.
+
+What:		/sys/bus/coresight/devices/<cti-name>/ctmid
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Display the associated CTM ID
+
+What:		/sys/bus/coresight/devices/<cti-name>/nr_trigger_cons
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Number of devices connected to triggers on this CTI
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/name
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Name of connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_signals
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Input trigger signals from connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_types
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Functional types for the input trigger signals
+		from connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_signals
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Output trigger signals to connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_types
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Functional types for the output trigger signals
+		to connected device <N>
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/inout_sel
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Select the index for inen and outen registers.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/inen
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write the CTIINEN register selected by inout_sel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/outen
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write the CTIOUTEN register selected by inout_sel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/gate
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write CTIGATE register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/asicctl
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Read or write ASICCTL register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/intack
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write the INTACK register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/appset
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Set CTIAPPSET register to activate channel. Read back to
+		determine current value of register.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/appclear
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write APPCLEAR register to deactivate channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/apppulse
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Write APPPULSE to pulse a channel active for one clock
+		cycle.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/chinstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) Read current status of channel inputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/choutstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of channel outputs.
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/triginstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of input trigger signals
+
+What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) read current status of output trigger signals.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Attach a CTI input trigger to a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_detach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Detach a CTI input trigger from a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_attach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Attach a CTI output trigger to a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_detach
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Detach a CTI output trigger from a CTM channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_enable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable CTIGATE for single channel (W) or list enabled
+		channels through the gate (R).
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_disable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Disable CTIGATE for single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_set
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Activate a single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_clear
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Deactivate a single channel.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_pulse
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Pulse a single channel - activate for a single clock cycle.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_filtered
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) List of output triggers filtered across all connections.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/trig_filter_enable
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Enable or disable trigger output signal filtering.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_inuse
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) show channels with at least one attached trigger signal.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_free
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(R) show channels with no attached trigger signals.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_view
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(RW) Write channel number to select a channel to view, read to
+		see triggers attached to selected channel on this CTI.
+
+What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_reset
+Date:		Jan 2020
+KernelVersion	5.6
+Contact:	Mike Leach or Mathieu Poirier
+Description:	(W) Clear all channel / trigger programming.
-- 
2.17.1

