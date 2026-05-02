Return-Path: <linux-doc+bounces-85462-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHBONa+U9Wm8MgIAu9opvQ
	(envelope-from <linux-doc+bounces-85462-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 08:07:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C004B11E6
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 08:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 709B23026F0E
	for <lists+linux-doc@lfdr.de>; Sat,  2 May 2026 06:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75832E889C;
	Sat,  2 May 2026 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Q/KZXedz"
X-Original-To: linux-doc@vger.kernel.org
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF52F12B3;
	Sat,  2 May 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777702039; cv=none; b=PsR3++ppunOwwXWsauwAkZG6SmDybF4jNXczI5JjmNQb6B/ek3ickvNZFVg6Y7LOmEySMpR9U3bw2A2mLkLKcRcooOKRYo+EqpinxMxLfvRdYxDY5LLZDz3jygqBl1nwGBlOKtY5fMr9nLNRBk5e3MkLNhEhV8ROPwCxjAyteb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777702039; c=relaxed/simple;
	bh=Vid1JBj8nCuW5dNpbsPqf85nkSqP3+GErdBE5ojAtwI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=kt+/HSN1cgTjWOgoYxYxJ52yizAh7nfIzMKi2ts+wXqXuswE+JkaMhHqFGduIldqeifOzma8yZ9zDUEqszIFulvU1+mgsrXrhEi+Kl3yqGnJ+jjcmXq83EQRWb77dj/v28i2GOc6C/Wo8H3T1vufkXK/d2pTV+Xvvq7DgH/sQJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Q/KZXedz; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777702026; bh=Jky+evJLIqJaEQMGtWnaMU3ymJWVi3lFosEz4lTsbq0=;
	h=From:To:Cc:Subject:Date;
	b=Q/KZXedzZuap9kWTy87UwXSlXrW+WGtejySJY7nwm9RXnvyH0gC7Pb637BoZ9sWaV
	 kurjmrAGpTLKV8WNw8jKb5+icYqsUJR6vhzN8NuztJE6qwzCMID+CVDR+JH/Ug5lFs
	 G5wBItiw7noFPrOsJ1E/trNglhyHI6B3V0Xsve1Q=
Received: from Lang.smartont.net ([223.88.152.211])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1C3A4067; Sat, 02 May 2026 14:07:03 +0800
X-QQ-mid: xmsmtpt1777702023tkggfwn67
Message-ID: <tencent_EC262467CD5E46CA97CF2B2FDCBCA0565C08@qq.com>
X-QQ-XMAILINFO: MS2Hp1XcKKWFlcLec/+xkFzHQUgT/cC/dcMpPdlUwtkunomGjUj/pQLc30IsWL
	 4CrtK1YjvIXeUEMZi3KiZdqG6XlCkCNf+0LzDNLdBKRknHgU/QP43/868ug4E31HA8ShITcZur81
	 nb9TDBxGv8Bsu4VGWgFTLRPVFy5OXWqW324caa8VXKcPkX5fxIjhKfePDWk2TM72KirHpav4FKTn
	 zydhjdVIi9EMdmhYJUa6j1bG7XUjPIwuzHb2WNGa37/jmwxU6Xevjpo/htaRoJ/CGegVUbkOTqc7
	 elBj+efcasfco+RhG4J9bZdeUZtJ3gNlloj+DLH20/8BAJYZtoj53+W6T29JwH1csxTVQZsb8ugJ
	 X4YhzkxdQ4IfcCsK+YCfEUs9DiGG2a31JpueTYd3IiIgZ+g8HmNLHTdEFR0WY8T6RThbIZFrenOn
	 JAbOQgFanFMaWt7ltfeb8ay0TWhrduMOV1bIxTWIaLfzGiELOJC4gdqe1DyD8UPAo4a8JJ72CC5l
	 eXsCGtdQ2Ftfd4b2+CGWOxE7AG2jRFxmH2yyA0oEE0PnVwL7Dkxj+NbpE77c6pM5RV4x3MnAnDro
	 esv0sVpW3wlFfUQXVdt7e+pvs8c9wMRjwCBLPqysIKFecPVRdhDHLHXYfkPk3VmVvm8whuqGWPqY
	 4WJXSA0uUwbCTCC5VjtENbg4miiy27woAOEH+wzm+j9dGVd7+JfN/npDZzyTtIh8GC2+zHuXugHz
	 WNeYMvTJ26fr40RybZ+SYu5k0xSBoODA06KNO/i3EstjHGM1h1FoPaN5bG4275SXJJfUuz62CVrM
	 HKcusrXFkSsGeHwul56p6QM1VXpWcpk0Xay0tLYoNGZ8rm0YHjnDIPmhngYYs1NWtydWBscn/+6Q
	 AUScIpzMJKz5g4SBT2sgyGknsSw4i1U9G6A6ViNquQYFeRVCj2bumc7YRzpdEYkI/Z5zEMZEi3y4
	 9upD2JAsGdgrMu2ZMx8RZ4aKTiWgdtwLYJpb3T0IrzSK/QPpo5cN1TYfsbJYXH2kspzXZfXgBcs6
	 5GeoYatmXhbCzzrlx/gZIvvuh/wc9TL1cUiDR9/shczffRMrjcC9BWxVGF28/WE59vgv5c5AgwDx
	 8VlBCssGn9Ina+Us3GSKkrrrpjP8ILvBx7U2lYg+rpKu9J9UOi6sv/shQbT1kiiAOYSxMSuH0TyP
	 54cPOX84I841uGnA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Wang Zihan <jiyu03@qq.com>
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wang Zihan <jiyu03@qq.com>
Subject: [PATCH v2] iio: adxl313: fix typos in documentation
Date: Sat,  2 May 2026 14:07:00 +0800
X-OQ-MSGID: <20260502060702.141661-1-jiyu03@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 41C004B11E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85462-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiyu03@qq.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,qq.com:dkim,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:url]

Add missing space in "ADXL313is" and correct "a single types"
to "a single type".

Signed-off-by: Wang Zihan <jiyu03@qq.com>
---
 Documentation/iio/adxl313.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/iio/adxl313.rst b/Documentation/iio/adxl313.rst
index 966e72c01..3662153a6 100644
--- a/Documentation/iio/adxl313.rst
+++ b/Documentation/iio/adxl313.rst
@@ -11,7 +11,7 @@ This driver supports Analog Device's ADXL313 on SPI/I2C bus.
 
 * `ADXL313 <https://www.analog.com/ADXL313>`_
 
-The ADXL313is a low noise density, low power, 3-axis accelerometer with
+The ADXL313 is a low noise density, low power, 3-axis accelerometer with
 selectable measurement ranges. The ADXL313 supports the ±0.5 g, ±1 g, ±2 g and
 ±4 g ranges.
 
@@ -112,7 +112,7 @@ apply the following formula:
 Where _offset and _scale are device attributes. If no _offset attribute is
 present, simply assume its value is 0.
 
-The ADXL313 driver offers data for a single types of channels, the table below
+The ADXL313 driver offers data for a single type of channels, the table below
 shows the measurement units for the processed value, which are defined by the
 IIO framework:
 
-- 
2.54.0


