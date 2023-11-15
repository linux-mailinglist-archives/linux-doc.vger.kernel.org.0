Return-Path: <linux-doc+bounces-1848-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B87E4F03
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 03:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74EF91F21A1E
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 02:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ACAEC2;
	Wed,  8 Nov 2023 02:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+Ui7wsh"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F70EA3;
	Wed,  8 Nov 2023 02:44:29 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4D0184;
	Tue,  7 Nov 2023 18:44:28 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc3c51f830so49098595ad.1;
        Tue, 07 Nov 2023 18:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699411468; x=1700016268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/wwdfRphBwJ10ItYJstxVI8q7C8OR1Gp20sJ7bfRFs=;
        b=A+Ui7wshVSwaOHJtbR9v+IawFMwF5KmHuhLClQbPBb9UNMtdNW7Na4rHP2421XyER7
         d0EOfwueIh9cBVOnX4toqWYb5KpwZfhdzrmV5D7VlTht7fMri0Dywszx6atQfs60fkvQ
         oMHF16nJImv/2V8Hu4jdnOo4RsWth0W8A0ugmdPce0fAY08WoOkexwI8WIYzXjR3KDOv
         dbd6WyKsS3skB/yo3qdcaYme7Eb3aMZmSwZryOHMjKTWfb6kWgZfxlmaRPWRxylN10I4
         2M1BzpWMcU1XzEgctMJhgfSKGiraEil9di2HgI3ZlgAonCZImZrRyNp5srp6g/8TsWRm
         yOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699411468; x=1700016268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/wwdfRphBwJ10ItYJstxVI8q7C8OR1Gp20sJ7bfRFs=;
        b=cletc0LnNFDEIFtX7+7eqlxLp3z4fvfSiSdzZAiisJZVhz6499I2xjvhqYLsZYemvw
         79e/rFAKipwfXtiyvsPHboeuQdh18aYX4L1k8KuQkHWJ0wdknd2hgJ8JSzkjxEfs0EZr
         e0cTeVQtKPDVBmmj2dcCOkur0CMEzQo8UDbHo409edcbbo6X1Oj/dDfe1ePtKtKWvf84
         rWzBBZYwbBBnHGuNfkJxi9JG7yXHg6QiANKOhix+61PtdQwhEPRWcfm9Pv7dgHVvS1Mv
         HNZiJCij3ZlSSzBagNfqUBcJTm/WqT/q1Cwc1OlcSYaJA3bU+vzOSmd6zn1chY3rnTQG
         PWPg==
X-Gm-Message-State: AOJu0YzABACGwiIbK8W1/9n/BzGpzOMFseyYRsXQ5KmmsALX/U8WCxd0
	RGszsbo7jNQwmTLn/QoQ78I=
X-Google-Smtp-Source: AGHT+IEOr1W+M8OwGU0II7Hj4G2oaJUl4uxectMyrXLZDreeT37M3r1Jc9zixvuwENvZpSAFSNcemQ==
X-Received: by 2002:a17:902:ead4:b0:1cc:ef37:664a with SMTP id p20-20020a170902ead400b001ccef37664amr777261pld.31.1699411468266;
        Tue, 07 Nov 2023 18:44:28 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a3-20020a1709027d8300b001c62e3e1286sm501681plm.166.2023.11.07.18.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 18:44:27 -0800 (PST)
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
	Vincent Tremblay <vincent@vtremblay.dev>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 0/2] hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857 controller
Date: Wed,  8 Nov 2023 10:42:17 +0800
Message-Id: <20231108024222.2026546-1-peter.yin@quantatw.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Yin <peteryin.openbmc@gmail.com>

Add support for mp2856/mp2857 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is a dual-loop, digital, multi-phase,
modulation controller.


Change log:

v1: Add support mp2856/mp2857
---
Peter Yin (2):
  dt-bindings: Add MP2856/MP2857 voltage regulator device
  hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857
    controller

 .../devicetree/bindings/trivial-devices.yaml  |   4 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp2856.rst                | 101 ++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp2856.c                  | 327 ++++++++++++++++++
 6 files changed, 443 insertions(+)
 create mode 100644 Documentation/hwmon/mp2856.rst
 create mode 100644 drivers/hwmon/pmbus/mp2856.c

-- 
2.25.1


