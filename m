Return-Path: <linux-doc+bounces-57890-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAFBB3B15B
	for <lists+linux-doc@lfdr.de>; Fri, 29 Aug 2025 05:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85FDB1C85C85
	for <lists+linux-doc@lfdr.de>; Fri, 29 Aug 2025 03:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C1D2236F0;
	Fri, 29 Aug 2025 03:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="bH0LyaZr"
X-Original-To: linux-doc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CC221FF23
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 03:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756436727; cv=none; b=HuhAPfabzY+qAf59Wg2PwbR7e1SXVTISfOA5HpoZbVs6z8mCYS0Qr/jhDPOYP25lmPhaE0t+bar6DFV016P0ZDQr55eMqUOy2fqvRfNP2Dtho8wdBixqDg7XxQ6yoyKdMqO+4l4J75KLueJg5woRih/h4uA8ZkrjGiMOZ1caVb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756436727; c=relaxed/simple;
	bh=JO1rRGYu9pEWqmHXj6LJP+xOXD46FjPQ/IqfNVc2OoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3e84AqhFfsWe9yG9wTxKyyop8aQKG0JwJ4nu3vg9JoXP6dE0jePuWA6qiYA3c0OA8MuFyveZ+bgIPKazNWVW/OpRFH3rXow9LD+KKTubDYqTe9mN9vQ7/z57Mjv/wzdzJlfoKrOIgxS4e4t2e0ogif/Gb42AS6WrwtGfqu1okk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=bH0LyaZr; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5B1522C083A;
	Fri, 29 Aug 2025 15:05:15 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1756436715;
	bh=EmjJVIThT5dBhkVX+UgGFdmFfsSQ9Z/giVg9K8ftIsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bH0LyaZro/x8I2q9fc6OdMZL4TH6zSHlxecbLVVNrWIERQ59R+vXl1adXy4jVn00M
	 TDIHUlYdXVTzoZfRH1UX221ZZyHviYq39tA2ejHyiif5k0z1vIJEXk355k+YBGQh5J
	 lwdL96f8cC3AZKJ4S1TZIJ2yh1PpPZDjsSm9+uf5i729mtqCn/Gnxp/gbCHHPyfxfO
	 iKFlwmAukkF9MbhPSEHNQ4shggLhyro1GO2rgWLpI9v08nSQtVGDJivl+AjFbA6ppW
	 ViSQG4GmgzmSUWw9YRmQ7hWgHeTip6vsh2JBR8uDh+I+vDVHSXyTpNCqX48Z/FAFTt
	 OM8iSRFzpIMBQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68b118eb0001>; Fri, 29 Aug 2025 15:05:15 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1A6BA13EE83;
	Fri, 29 Aug 2025 15:05:15 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 177B8280222; Fri, 29 Aug 2025 15:05:15 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	wenliang202407@163.com,
	jre@pengutronix.de
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/4] dt-bindings: hwmon: ti,ina2xx: Add INA780 device
Date: Fri, 29 Aug 2025 15:05:09 +1200
Message-ID: <20250829030512.1179998-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829030512.1179998-1-chris.packham@alliedtelesis.co.nz>
References: <20250829030512.1179998-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Yo+sRJYX c=1 sm=1 tr=0 ts=68b118eb a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=2OwXVqhp2XgA:10 a=XYAwZIGsAAAA:8 a=OlvLmGV33yd2spdxUc8A:9 a=3ZKOabzyN94A:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a compatible string for the INA780 device.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v3:
    - Collect ack from Conor

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Doc=
umentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index fa68b99ef2e2..980ecba6d811 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -32,6 +32,7 @@ properties:
       - ti,ina237
       - ti,ina238
       - ti,ina260
+      - ti,ina780
=20
   reg:
     maxItems: 1
--=20
2.51.0


