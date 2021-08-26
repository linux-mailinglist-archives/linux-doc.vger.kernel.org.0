Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F893F877A
	for <lists+linux-doc@lfdr.de>; Thu, 26 Aug 2021 14:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241021AbhHZMba (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Aug 2021 08:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240886AbhHZMba (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Aug 2021 08:31:30 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4846C0613C1
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i28so6532897lfl.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GhgYsmvqrAxJX0LtPmrYeEXggYv/fhoAephchEquNLc=;
        b=SiDDwqW32wUAav4VM8KMQ9B6zVIWZUVIv8hwgF0PUZM6+DGTErVzzLpW1QVyZSthdJ
         xDCc4TxDcP4XAVEhblYC1/AZA+NQz1/quHZ5jKMYnhRrk2RFxGDEBAR8WFO+qPjU8LGm
         Vz07x9i9zOh6Mr/J2dy/0Q/q+cJ1BBcyOAyKNfr5VVqulgD8ONj21JQPPbXP7UNszXRo
         rnvXdeMIuCmXsqqxp/5j38Q+YPr/FctuEIrowQwltE74+7XgEyzbh0gEvFW5NMoQG04U
         EWudR3uMOWWZhdcrHurLQV4qtxDa86g7LQCU0Ou+FFwmVGZsxbDZKabPS5MXGzx+RAyE
         CmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhgYsmvqrAxJX0LtPmrYeEXggYv/fhoAephchEquNLc=;
        b=cf6c6LbztS8IuxJqzpak0X+L9Ek8itbVHb/b5BYDYum+oruMf40wBnTH9bEvU5W92Z
         kSyYK7Huf4wndIE6yTJpYaQNL5b4VeyMJW9EThcSeKELJvNy+MX25Zioqrul/UstZAFu
         yxixtcRrO9KQQGSvYFx0WlMid/X7QoP20OIPhueESVPVm1CuWMZUpEU3ULAUt1hZT9E6
         zQsGWF/gFwcGcxscYJBXduYmUaFh3WIpzVaknx3K71/4wiC2uzzJ0eOengFrsnLZ83bR
         YAahZB+aohhPlGlzSy7CWDNwMCjFyMgAsTq3ciXLtWNwrbxtl0v8xIkbS8dhpQeb+wyz
         JRTg==
X-Gm-Message-State: AOAM531+aFkgK1Jgl/C9RgiMWfIlbaZLfoEDpHExbPLFmaG/uHxZUrXS
        W3GpNy12gfbpGHM9B1oZmjMT0Q==
X-Google-Smtp-Source: ABdhPJzXMNNF/bi1HIJqWX3/mI79XcU/bUU6dSehJCcvs2LOiH6i8Tz11P+VEt73eqlvd3LlKmse5A==
X-Received: by 2002:a19:c148:: with SMTP id r69mr487638lff.281.1629981041039;
        Thu, 26 Aug 2021 05:30:41 -0700 (PDT)
Received: from jade.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j21sm332283ljh.87.2021.08.26.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:30:40 -0700 (PDT)
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
Subject: [PATCH v5 1/6] docs: staging/tee.rst: add a section on OP-TEE notifications
Date:   Thu, 26 Aug 2021 14:30:27 +0200
Message-Id: <20210826123032.1732926-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826123032.1732926-1-jens.wiklander@linaro.org>
References: <20210826123032.1732926-1-jens.wiklander@linaro.org>
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

