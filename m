Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFDAE181892
	for <lists+linux-doc@lfdr.de>; Wed, 11 Mar 2020 13:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbgCKMrE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Mar 2020 08:47:04 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:55591 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbgCKMq6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Mar 2020 08:46:58 -0400
Received: by mail-wm1-f47.google.com with SMTP id 6so1931399wmi.5
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2020 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3krMYkJ5TguiyRWERa/+CMYLcOJYUhlPd6t/ch8qqgQ=;
        b=v/Zaf60vUqEkNfZdt1gJK9VC+hb3PZmmanEVWPvFm7vnZBA5ZwW1m4ZykGbhtwPbxS
         WDb8SaSMRfYNq9MWw8D64WiMIUDABRqX0BpAT4ePCPBmBilmDeqovdmyjQQbeeinzjT3
         dU7ZYFiTiptVbhWvRNSSwkbXuMm85b7zo3+WewNnxbyUAgpAYg6IacX7b8dZIsVjmoPL
         ljKaqQwgtRwTqJbizGpaPcYht4A3xsbwTlrPglZUOAUbUiWXn8f1kPSnUL4oTeXCwx5a
         HVG7oETbPqToLR4mHqQQfeuOcp3PJuFsthzK2H6yoTG+E5ivLt3KD6d/PuIk6kKoxhmV
         ptdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3krMYkJ5TguiyRWERa/+CMYLcOJYUhlPd6t/ch8qqgQ=;
        b=TyOF7TLe/r+cFRrnkSTszRRzyCPkOvpfkOfzdQvYLWf081JefGmRLUkRkBj5vWeC15
         +PeibrbYNem3JzLf/+H6TDVo6KFE55gsyPskkH0YGmjOi+6neA/QOyZMpyzlBePavkPY
         8MgD07k/AQdtu5YqXVRgIBCKNMKPgGMRf8/GCfvd2Hk76sIQ1N4DmApL2N5hvF6/Vvw/
         /dF9+Qc+0qbc4iYAs9E/Wgu8hV5oj4beY1ZFyty8+uMtRlbdXe7s7z3gUCpkouZ5XGCj
         uhNXGG9+fIkfXZMEezcyEC5wzFu6tYWSRDdwtehGiH+oPiDmCTgl6CXy4WMxSULrPlIS
         N+yw==
X-Gm-Message-State: ANhLgQ0sVhq7Y/r1oHJ1h8/eEcVb1t15uICAvf+RBB8wZu9JtCdtS3qo
        IbalvxU8fAJRWoOpBVt5E/OVV7LznBs=
X-Google-Smtp-Source: ADFU+vt+OuMwfLSUXiB+t1SNAG3tC3rRy29ica+E537TLkfPGDuXQo1KUhGf31RO2GY8IfyREARQ2w==
X-Received: by 2002:a1c:c3c3:: with SMTP id t186mr3842975wmf.118.1583930815804;
        Wed, 11 Mar 2020 05:46:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id c2sm8380020wma.39.2020.03.11.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:46:55 -0700 (PDT)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     bhelgaas@google.com, will@kernel.org, robh+dt@kernel.org,
        joro@8bytes.org, baolu.lu@linux.intel.com, sudeep.holla@arm.com,
        linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org
Cc:     lorenzo.pieralisi@arm.com, corbet@lwn.net, mark.rutland@arm.com,
        liviu.dudau@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
        lenb@kernel.org, robin.murphy@arm.com, dwmw2@infradead.org,
        amurray@thegoodpenguin.co.uk, frowand.list@gmail.com,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/11] dt-bindings: PCI: generic: Add ats-supported property
Date:   Wed, 11 Mar 2020 13:44:56 +0100
Message-Id: <20200311124506.208376-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311124506.208376-1-jean-philippe@linaro.org>
References: <20200311124506.208376-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a way for firmware to tell the OS that ATS is supported by the PCI
root complex. An endpoint with ATS enabled may send Translation Requests
and Translated Memory Requests, which look just like Normal Memory
Requests with a non-zero AT field. So a root controller that ignores the
AT field may simply forward the request to the IOMMU as a Normal Memory
Request, which could end badly. In any case, the endpoint will be
unusable.

The ats-supported property allows the OS to only enable ATS in endpoints
if the root controller can handle ATS requests. Only add the property to
pcie-host-ecam-generic for the moment. For non-generic root controllers,
availability of ATS can be inferred from the compatible string.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 Documentation/devicetree/bindings/pci/host-generic-pci.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
index 47353d0cd394..7d40edd7f1ef 100644
--- a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
+++ b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
@@ -107,6 +107,12 @@ properties:
 
   dma-coherent: true
 
+  ats-supported:
+    description:
+      Indicates that a PCIe host controller supports ATS, and can handle Memory
+      Requests with Address Type (AT).
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.25.1

