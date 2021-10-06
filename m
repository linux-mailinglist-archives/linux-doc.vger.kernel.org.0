Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FF542389F
	for <lists+linux-doc@lfdr.de>; Wed,  6 Oct 2021 09:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbhJFHRy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Oct 2021 03:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237408AbhJFHRw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 03:17:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F29AC061753
        for <linux-doc@vger.kernel.org>; Wed,  6 Oct 2021 00:15:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id n8so6315450lfk.6
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GhgYsmvqrAxJX0LtPmrYeEXggYv/fhoAephchEquNLc=;
        b=qZ2J2cmjhB2VqX9Km6Q6J8+EDY/Byt4T6pq0U/D0wN4lykmD63FfuuD+fJIfFHVRZz
         xKFpUozUWuvyHcdHgrwmFIBMmoP4J197KoLhErtOskLIxdLjFontl7R9pQAyKhpcdPrs
         K9uWPcqht+rCnG1ENKmU+h2xP38N1+OO9nKfWUqrjr77EDSOV0iHoqd5DKQAEqUaJA2p
         WGgNwU+oGWY22rtQfAd8dui1O5aJvRnuF+dw8RVjAAz1RkSLBBuKxN8XS6htvnM2ceGl
         NoQ2U/sUNulNe/Toti1VtEvIc/fXLULR8NcXEZ9zB2uaYQg91ryWFSJsrVXuiOlxrDHF
         REJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhgYsmvqrAxJX0LtPmrYeEXggYv/fhoAephchEquNLc=;
        b=VYhO5mAzoH1ArCwmwyHyhTgb5T2kcSN1EWUDDQPaVUf+eBl36LTqNOdWHs2ov2VacU
         xOccVTyz0DJCXY5Q5WcdgmENWIps/Rll2/nIp0F7RB2uGSzHfDHS16TZfDU2i2mFJhI7
         K8xq5DRXL2LVNrBV/CR4Tu33tlBjTykwc1Ip3Akbm0xWkiwTS5labFZtps3pEah6Kg/l
         HAajzC4DZIwxD1oNziK1SZWjdf6+Z3nHfGfjGzqD4kV0Y4t3JZW5gupgyQBovP/enTcd
         EW73ynlCgq+oqc6RQe6PWDNsaZ2LxkNotog9I7v5zx0BHMQTHOpYyeQxcW24ytsqznDW
         Gp/A==
X-Gm-Message-State: AOAM530RhKsrUfvzhIVqloK817y2LG636r/QCXRh6S2oTPOvakftenJI
        +e6ol53bxnrv2gm+Hkj06NSB/A==
X-Google-Smtp-Source: ABdhPJwtfl7F40OaEjwCa3PdkHOjNi97Tw8IzsbW5Pthd2LioQtmz+sAMXibm8v3pPCOhxrMakoxGw==
X-Received: by 2002:a05:6512:3a83:: with SMTP id q3mr8077047lfu.115.1633504557651;
        Wed, 06 Oct 2021 00:15:57 -0700 (PDT)
Received: from jade.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y7sm960376lfk.143.2021.10.06.00.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 00:15:57 -0700 (PDT)
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 1/6] docs: staging/tee.rst: add a section on OP-TEE notifications
Date:   Wed,  6 Oct 2021 09:15:41 +0200
Message-Id: <20211006071546.2540920-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006071546.2540920-1-jens.wiklander@linaro.org>
References: <20211006071546.2540920-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds a section on notifications used by OP-TEE, synchronous and
asynchronous.

Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 Documentation/staging/tee.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
index 4d4b5f889603..3c63d8dcd61e 100644
--- a/Documentation/staging/tee.rst
+++ b/Documentation/staging/tee.rst
@@ -184,6 +184,36 @@ order to support device enumeration. In other words, OP-TEE driver invokes this
 application to retrieve a list of Trusted Applications which can be registered
 as devices on the TEE bus.
 
+OP-TEE notifications
+--------------------
+
+There are two kinds of notifications that secure world can use to make
+normal world aware of some event.
+
+1. Synchronous notifications delivered with ``OPTEE_RPC_CMD_NOTIFICATION``
+   using the ``OPTEE_RPC_NOTIFICATION_SEND`` parameter.
+2. Asynchronous notifications delivered with a combination of a non-secure
+   edge-triggered interrupt and a fast call from the non-secure interrupt
+   handler.
+
+Synchronous notifications are limited by depending on RPC for delivery,
+this is only usable when secure world is entered with a yielding call via
+``OPTEE_SMC_CALL_WITH_ARG``. This excludes such notifications from secure
+world interrupt handlers.
+
+An asynchronous notification is delivered via a non-secure edge-triggered
+interrupt to an interrupt handler registered in the OP-TEE driver. The
+actual notification value are retrieved with the fast call
+``OPTEE_SMC_GET_ASYNC_NOTIF_VALUE``. Note that one interrupt can represent
+multiple notifications.
+
+One notification value ``OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF`` has a
+special meaning. When this value is received it means that normal world is
+supposed to make a yielding call ``OPTEE_MSG_CMD_DO_BOTTOM_HALF``. This
+call is done from the thread assisting the interrupt handler. This is a
+building block for OP-TEE OS in secure world to implement the top half and
+bottom half style of device drivers.
+
 AMD-TEE driver
 ==============
 
-- 
2.31.1

