Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589E31ECE6D
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2020 13:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgFCLbv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Jun 2020 07:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgFCLbu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Jun 2020 07:31:50 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E476CC08C5C1
        for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2020 04:31:49 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bh7so715780plb.11
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2020 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qk6h3/uMt30VL5gHNd0CIGo1xzT6Suvapd6Zkcc+DKM=;
        b=RrVEBwVQcLUCGqEsQJpXqOjWAC7D12BFnkAzXds6Ldo3QcDZzph+tDvYWmHFe0lWhv
         NzphH34M9lMai8xEnODbbQBiX1I3Q1lOWXWfx3vFO3Ivf3YxSOsF3S1z0b0YsXmVCqe6
         2557nioENqUygaKxfXPSKYaHR/WHtc26Y0VOKArCfWFAv0FAXiLRraAxID6yitkllEJp
         miGHOkxiCZLl8prcEtAuGaV2mwvp/D4j4JrBkYe7Or8TtLHHpGcW+zgJBYJJvZuY+lZF
         2DcaYdr6nli5fNc/Dc0Aptc2BH7m81IUJ0zndV/+7pN50ImUIMH0IdwgfjEaYKLi2iRe
         1+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qk6h3/uMt30VL5gHNd0CIGo1xzT6Suvapd6Zkcc+DKM=;
        b=gd9P6gIFCOS4a/HDVHvXFtBRbOD9gWYpJV1LUDVdojlEUXoy6ZSkJs2cDBUQ3qLwny
         QX7mxuYnJ9rWVXfL7lXhBcPMlwGVT3wMOB56WFWfPMX8jf0eNtBFBrIVUr/eHv6LtJLt
         UWc0PxgZb6ee5+3TJopyJie7PB4vNy0y2rVdlYzKUOpwTINfBuLCp6555uvXZLagGZDk
         xArggY9YiCy/sMSjHFalnyurVXs0B9VfVOtFhHX8B1PMrrD3BKhAK+1ODht8QOKIN5Z+
         acBfSC+dmroYM3VOYjvBPFcH4WhAAcYrP+oWUGtE/xbQ1pwydQCaCoKvRIMaF7gxl+iE
         4M6w==
X-Gm-Message-State: AOAM532mNpQc0B1iLzoT18sDhmNTP4oYZSUJIlSgGKidpwD9/b69tiZw
        H896N5dMBumVCzxAMW4fg0CcxBUrrDQ=
X-Google-Smtp-Source: ABdhPJx1hupOSx1MjWX0wzHnvPBht00diFTwhauAGcYrofBJ0Z1tYUFmmuAKQDX/qg1grKkCKOdBgQ==
X-Received: by 2002:a17:902:70c2:: with SMTP id l2mr22838292plt.237.1591183909305;
        Wed, 03 Jun 2020 04:31:49 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
        by smtp.gmail.com with ESMTPSA id n2sm1842942pfd.125.2020.06.03.04.31.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 04:31:48 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jens.wiklander@linaro.org, corbet@lwn.net
Cc:     maxim.uvarov@linaro.org, jarkko.sakkinen@linux.intel.com,
        tee-dev@lists.linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] Documentation: tee: Document TEE kernel interface
Date:   Wed,  3 Jun 2020 17:01:28 +0530
Message-Id: <1591183888-11101-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update documentation with TEE bus infrastructure which provides an
interface for kernel client drivers to communicate with corresponding
Trusted Application.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 Documentation/tee.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/tee.txt b/Documentation/tee.txt
index c8fad81..428d3b5 100644
--- a/Documentation/tee.txt
+++ b/Documentation/tee.txt
@@ -53,6 +53,28 @@ clients, forward them to the TEE and send back the results. In the case of
 supplicants the communication goes in the other direction, the TEE sends
 requests to the supplicant which then sends back the result.
 
+The TEE kernel interface
+========================
+
+Kernel provides a TEE bus infrastructure where a Trusted Application is
+represented as a device identified via Universally Unique Identifier (UUID) and
+client drivers register a table of supported device UUIDs.
+
+TEE bus infrastructure registers following APIs:
+-  match(): iterates over the client driver UUID table to find a corresponding
+   match for device UUID. If a match is found, then this particular device is
+   probed via corresponding probe API registered by the client driver. This
+   process happens whenever a device or a client driver is registered with TEE
+   bus.
+-  uevent(): notifies user-space (udev) whenever a new device is registered on
+   TEE bus for auto-loading of modularized client drivers.
+
+TEE bus device enumeration is specific to underlying TEE implementation, so it
+is left open for TEE drivers to provide corresponding implementation.
+
+Then TEE client driver can talk to a matched Trusted Application using APIs
+listed in include/linux/tee_drv.h.
+
 OP-TEE driver
 =============
 
@@ -112,6 +134,14 @@ kernel are handled by the kernel driver. Other RPC messages will be forwarded to
 tee-supplicant without further involvement of the driver, except switching
 shared memory buffer representation.
 
+OP-TEE device enumeration
+-------------------------
+
+OP-TEE provides a pseudo Trusted Application: drivers/tee/optee/device.c in
+order to support device enumeration. In other words, OP-TEE driver invokes this
+application to retrieve a list of Trusted Applications which can be registered
+as devices on the TEE bus.
+
 AMD-TEE driver
 ==============
 
-- 
2.7.4

