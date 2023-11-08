Return-Path: <linux-doc+bounces-1849-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF77E4F09
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 03:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8E31C20CBF
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 02:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B0DEC2;
	Wed,  8 Nov 2023 02:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/kDbkb5"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE79FEA3;
	Wed,  8 Nov 2023 02:44:46 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4251D184;
	Tue,  7 Nov 2023 18:44:46 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c43f830566so1120052b3a.2;
        Tue, 07 Nov 2023 18:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699411486; x=1700016286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaWMuBZsE77+sJmzkMMfCx99qAMSCTeUv3FWDy05Y/4=;
        b=E/kDbkb5g9KLfaN4B+sN+5ndyodcKYCLHb/khydo1bGUMexCFfGLHdZaVQEqPr3aON
         KFpQHAfn5bH5jYtz9C/1jD/3vE89hNc7vosReT1beUaEwYXBwHtTt++hYoQOAuuWji1D
         K9H+daXgcTPTj62eRtqDNSCk2P8U4mbc9XnxyIRtmwGpk6QH2fFl5QxBCF67vnY18FeL
         4JCgimuW9O/r9WD0NoOIqAR5rDwaYzJhatZyMuaktkKvzBu13pbCMjm4UlBoT6naIE/n
         TtisD07ZqQVmN40Axoi4jLcvVWrlwyuuFGT1g51+6uUwhrD4AhXRX7fLAAKoYkmaFAzT
         ku/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699411486; x=1700016286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaWMuBZsE77+sJmzkMMfCx99qAMSCTeUv3FWDy05Y/4=;
        b=WYklshAYonF0KojviWEU5n98O6TQp1latQL2zWoywRFKeTQ65JX8Vc6jXT7deN8H9f
         3VDttPyzRifn4Uzubvjh9RBI+62EGkfDkMHsc8Rsx+Ek/UYqTOCAW74DxqUr1/HAA/2C
         QKEbUguU1sbDCW3y3W/DBCidfg2AjEVgzGHFZOgCckUzrxK7UU94QO3kDgQJnXURVWFa
         joBH4npnOcjXc43BuberU7STUz7OOTFbAz2TQAyw9+zMN0B3fmslN/f3CLqBhOq/iBbn
         1yCrVBOqRLDap/FEIK7yCjjcqxjX5DjCCWnjkfh0YY792rSJJQMVeCO/dN0iwe3ZHMUj
         BnGg==
X-Gm-Message-State: AOJu0YyXmTOWjbYNTocHUTqNIxWvRMQip7hXcf8/s7W8kRQR+YKo3OSr
	PTnI6WzBv+T7xno4iwlw33g=
X-Google-Smtp-Source: AGHT+IGLMtlPMSTy5c8cTvFdPewxETTXsWBn2fW+mmDuiGwsHZY5LTVTvUB2UkgKOIEtHXCdQjf/8Q==
X-Received: by 2002:a05:6a20:7289:b0:180:1b3b:d560 with SMTP id o9-20020a056a20728900b001801b3bd560mr962670pzk.41.1699411485695;
        Tue, 07 Nov 2023 18:44:45 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a3-20020a1709027d8300b001c62e3e1286sm501681plm.166.2023.11.07.18.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 18:44:45 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
X-Google-Original-From: Peter Yin <peter.yin@quantatw.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Brown <broonie@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Vincent Tremblay <vincent@vtremblay.dev>,
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: Add MP2856/MP2857 voltage regulator device
Date: Wed,  8 Nov 2023 10:42:18 +0800
Message-Id: <20231108024222.2026546-2-peter.yin@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108024222.2026546-1-peter.yin@quantatw.com>
References: <20231108024222.2026546-1-peter.yin@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Yin <peteryin.openbmc@gmail.com>

Monolithic Power Systems, Inc. (MPS) MP2856/MP2857
dual-loop, digital, multi-phase controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 7680c8a9b4ad..8dca0864709b 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -117,6 +117,10 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # Monolithic Power Systems Inc. multi-phase controller mp2856
+          - mps,mp2856
+            # Monolithic Power Systems Inc. multi-phase controller mp2857
+          - mps,mp2857
             # Monolithic Power Systems Inc. multi-phase controller mp2888
           - mps,mp2888
             # Monolithic Power Systems Inc. multi-phase controller mp2971
-- 
2.25.1


