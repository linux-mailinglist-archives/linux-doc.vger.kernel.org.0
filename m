Return-Path: <linux-doc+bounces-95714-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HHWAC8RXTmrWKwIAu9opvQ
	(envelope-from <linux-doc+bounces-95714-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:59:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005F727049
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=PPh5n0Rc;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95714-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95714-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96D90300620D
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 13:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295463CF67F;
	Wed,  8 Jul 2026 13:59:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95105380FF4;
	Wed,  8 Jul 2026 13:59:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519165; cv=none; b=C5j1KvrR9/1aIguWLVTCHfM9gXbMgT21GZdQ1CmD1VJZPU7nLDf0cgV4DryCXBYevk9jTekoQvkusCRgwLqBlJvgG0s84fs0u/9/ozYv8yEHodryHO/kCv2R/WbbnBg+H9jcQi/ofNOi8sSqasDGgbp7+2D8seFzyyxsjuz90DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519165; c=relaxed/simple;
	bh=egpzf7FOljHOA/UNeDZ0uuZAzOwk9J//58dI10sIFww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cKHSd416rvP20Xw0v5q+4vG/mlvKuPckYNx/oI7w7R3tf8FYH69969VZnfaBgR3nBzDxco+CTp0rvugEgYQdrYtt7KWgWDS7MdHyA7nTO2df8rj5WEzJh/W9ne1AIRtBg0pkLatpdibXLaBH0ojErstaQoolmIikqk64w67afeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PPh5n0Rc; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0B6B152B;
	Wed,  8 Jul 2026 06:59:18 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EC253F66F;
	Wed,  8 Jul 2026 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783519162; bh=egpzf7FOljHOA/UNeDZ0uuZAzOwk9J//58dI10sIFww=;
	h=From:Subject:Date:To:Cc:From;
	b=PPh5n0Rckf4lPT5ow/Rp0ugC+rxNZkCQVJJXF0ETmkRNYeQcxFnVRsmQo1ikDUSUN
	 NHgcSsIjM1TaYUpQRzAsK5Iu7jfGNS9QvFXLun9ISW97tCqPB5kZMG02XcsGCa7tyW
	 34qZIeUqLvT1FPNy3Efqhmh1/RrhEH/7DAsWJEzI=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Subject: [PATCH v7 00/10] ACPI: APEI: share GHES CPER helpers and add DT
 FFH provider
Date: Wed, 08 Jul 2026 14:58:59 +0100
Message-Id: <20260708-topics-ahmtib01-ras_ffh_arm_internal_review-v7-0-8b3a85216cef@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKNXTmoC/5XRzWqEMBSG4VsZsm4k50x+dFa9j1Ik5qcGqg6J2
 JbBe+9xoFiXLr9AnjeQByshp1DY7fJgOSyppGmkYV4uzPV2/Ag8edoMBWqBKPg83ZMr3PbDnDo
 BPNvSxti3Ng9tGueQR/vZblL44l303pnojLMdI/GeQ0zfz9rbO+0+lXnKP8/4Atvp1lGAYACwl
 qqCGiRAw2ELBl9R075SqnLTwDZiwb9r55+3IBf8Kk206M1VQXeU5S4rqM/JkmSJuqm1UZ3VcJT
 VPxmbc7IiGYNQQngKSDzKepc1mHOyJrmBaOgDjLRW7PK6rr881bvuKQIAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Hanjun Guo <guohanjun@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Shuai Xue <xueshuai@linux.alibaba.com>, Len Brown <lenb@kernel.org>, 
 Saket Dumbre <saket.dumbre@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jic23@kernel.org>, Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>, 
 Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Ahmed Tiba <ahmed.tiba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-cxl@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-edac@vger.kernel.org, 
 linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783519157; l=2775;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=egpzf7FOljHOA/UNeDZ0uuZAzOwk9J//58dI10sIFww=;
 b=z0wp9aIYNr5NMorh09jiJbcMtJLugd5jUHOdl53jOd3TImjbi3fvS+YXV8tvo1u999mp+hyAF
 A6HNDu/8MqQCkzA5Have9zBAay47klANWoyQ5GlaL26mz974WlQDnIH
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95714-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,alien8.de,huawei.com,linux.alibaba.com,stgolabs.net,zohomail.com,linux.ibm.com,gmail.com,google.com,arm.com,lwn.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:tony.luck@intel.com,m:bp@alien8.de,m:guohanjun@huawei.com,m:mchehab@kernel.org,m:xueshuai@linux.alibaba.com,m:lenb@kernel.org,m:saket.dumbre@intel.com,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:djbw@kernel.org,m:iweiny@kernel.org,m:ming.li@zohomail.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:ahmed.tiba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:acpica-devel@lists.linux.dev,m:linux-cxl@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-edac@vger.kernel.org,m:linux-doc@vger.kernel.org,m:Dmitry.Lamerov@arm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ahmed.tiba@arm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmed.tiba@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7005F727049

This is v7 of the GHES refactor series. Compared to v6, it addresses
the Sashiko-reported issues including pre-existing ones and fixes
the ACPI-disabled cper-x86 build break.

The DT firmware-first CPER provider is intended for the upstream zena-css
platform. Validation so far has been on FVP.

Changes in v7:
- Address Sashiko-reported issues for this series, including pre-existing ones.
- Fix pre-existing CPER header overflow validation in cper.c.
- Fix AER recovery leak when no pci_dev is found.
- For DT provider: serialize pool init, return IRQ_NONE on empty status,
  add OF_RESERVED_MEM dependency, and harden status length checks.
- Include <asm/acpi.h> in cper-x86.c for ACPI-disabled builds.
- Link to v6: https://lore.kernel.org/r/20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-0-91f725174aa0@arm.com

---
Ahmed Tiba (10):
      ACPI: APEI: GHES: share macros via a private header
      ACPI: APEI: GHES: move CPER read helpers
      ACPI: APEI: GHES: move GHESv2 ack and alloc helpers
      ACPI: APEI: GHES: move estatus cache helpers
      ACPI: APEI: GHES: move vendor record helpers
      ACPI: APEI: GHES: move CXL CPER helpers
      ACPI: APEI: introduce GHES helper
      ACPI: APEI: share GHES CPER helpers
      dt-bindings: firmware: add arm,ras-cper
      RAS: add firmware-first CPER provider

 Documentation/admin-guide/RAS/main.rst             |   15 +
 .../devicetree/bindings/firmware/arm,ras-cper.yaml |   52 +
 MAINTAINERS                                        |    6 +
 drivers/Makefile                                   |    1 +
 drivers/acpi/Kconfig                               |    4 +
 drivers/acpi/apei/Kconfig                          |    1 +
 drivers/acpi/apei/apei-internal.h                  |    3 +-
 drivers/acpi/apei/ghes.c                           | 1044 +-----------------
 drivers/acpi/apei/ghes_cper.c                      | 1122 ++++++++++++++++++++
 drivers/firmware/efi/cper-x86.c                    |    1 +
 drivers/firmware/efi/cper.c                        |    3 +-
 drivers/pci/pcie/aer.c                             |    9 +-
 drivers/ras/Kconfig                                |   12 +
 drivers/ras/Makefile                               |    1 +
 drivers/ras/cper-esource.c                         |  332 ++++++
 include/acpi/ghes.h                                |   10 +-
 include/acpi/ghes_cper.h                           |  141 +++
 include/cxl/event.h                                |    2 +-
 18 files changed, 1709 insertions(+), 1050 deletions(-)
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260220-topics-ahmtib01-ras_ffh_arm_internal_review-bfddc7fc7cab

Best regards,
-- 
Ahmed Tiba <ahmed.tiba@arm.com>


