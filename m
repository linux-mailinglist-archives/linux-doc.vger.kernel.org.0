Return-Path: <linux-doc+bounces-92755-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B6eFOO3yM2p+JgYAu9opvQ
	(envelope-from <linux-doc+bounces-92755-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 15:30:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EC66A088B
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 15:30:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=HZFyscYQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92755-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92755-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 865E9307B4C3
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 13:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB003E95A3;
	Thu, 18 Jun 2026 13:27:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F512F0C7E;
	Thu, 18 Jun 2026 13:27:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789269; cv=none; b=aHZIf7X4mepz5/w56EkyTlgiL7qoK5HTpegTrn6nFwLTjtagtOMgO+axyH7bgFIYLznpN8669Sm9aNwQDOF8u+jRRHv4WML0azDZNCHi3xjOdEKMyHNOhUI7MW8j05PVW9cW20Oc+BEdkKV8QFnawvW/0pEsq5A++eiaspxuUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789269; c=relaxed/simple;
	bh=V0khQDdLNf2hE32Qb1Tq3qEe+rLO96hizvVQe7Rtqp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uGxaOV5lWALmNULrzSIZhqX8nbKMQmnNla+GI+jUDfWi4fuYt4kb5hZIsi7OaCNVgdaiDL1uIj+zEAKuzfwmX0wMsReTN48CSJdz0GSOUCdKCnjPdQZGlOGDX1Aw7a5Rpi5hEWgEKfoeSuH5wNTnxrtDNyy2YIZ5vVULkOOQ3d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZFyscYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77AADC2BCB0;
	Thu, 18 Jun 2026 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781789269;
	bh=V0khQDdLNf2hE32Qb1Tq3qEe+rLO96hizvVQe7Rtqp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HZFyscYQcm3mkpbTYXw5YV//vxsPu21tUY0lFNv5cSoafO6/VPIZvomr7w6ldq3ke
	 vyCRt/GEH9gyhuxcoKskTJsnkxVZbIRFySfQf1I90AUiVGPe5qUS+3liVgFBBp3j+Y
	 LJe4IEVcZs8sLotVF5JVp/jwNb512rPOgK1zNd254jjIIbnSIQqpZUQd27KvvGiKov
	 u0RHOCM9gxI+k3VDUBDJJPgSOxs/BLn1QYlsYmVOzjeNsfTD1BkXvL+bnlWC7uHUl/
	 yWVKAocwdIitNABNQxPLBg2ZSRmVJU+y52+nQivw7VuekSzlUJqBJ9WRvN2rmWZkWj
	 +EVNbjbB3UQtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6BFCD98F2;
	Thu, 18 Jun 2026 13:27:49 +0000 (UTC)
From: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Date: Thu, 18 Jun 2026 14:27:17 +0100
Subject: [PATCH v6 01/16] iio: ABI: add attributes for altcurrent channels
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ad9910-iio-driver-v6-1-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
In-Reply-To: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rodrigo Alencar <rodrigo.alencar@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781789267; l=3206;
 i=rodrigo.alencar@analog.com; s=default; h=from:subject:message-id;
 bh=NiWtbyulciSktUuQAWNxnjqRnd2cLUrOzF/zc+CBYAA=;
 b=1PwM7HMSbKAVyvezbsBzYK66qZCToVvWtEZOg1mEXFrN9ubDqH9Y7MnBPyIVioRj0Qx9qEyWv
 T8J2g8KsUAHDZ5JukT3EW6rP0mcyG0swgTOymU/7HJSooo00AKaKpe7
X-Developer-Key: i=rodrigo.alencar@analog.com; a=ed25519;
 pk=ULeHbgU/OYh/PG/4anHDfLgldFItQHAhOktYRVLMFRo=
X-Endpoint-Received: by B4 Relay for rodrigo.alencar@analog.com/default
 with auth_id=561
X-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Reply-To: rodrigo.alencar@analog.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92755-lists,linux-doc=lfdr.de,rodrigo.alencar.analog.com];
	FORGED_RECIPIENTS(0.00)[m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:rodrigo.alencar@analog.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[rodrigo.alencar@analog.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,analog.com:replyto,analog.com:email,analog.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84EC66A088B

From: Rodrigo Alencar <rodrigo.alencar@analog.com>

Add missing attributes applicable to altcurrent channels, e.g., frequency,
phase, scale, raw, label and powerdown.

Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index d8d6d85235b0..f52db6abcf31 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -478,6 +478,8 @@ What:		/sys/bus/iio/devices/iio:deviceX/in_currentY_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_currentY_supply_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_current_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_current_q_scale
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_scale
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_peak_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_anglvel_scale
@@ -798,6 +800,8 @@ What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_powerdown
 What:		/sys/bus/iio/devices/iio:deviceX/out_voltage_powerdown
 What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_powerdown
 What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltage_powerdown
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_powerdown
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent_powerdown
 KernelVersion:	2.6.38
 Contact:	linux-iio@vger.kernel.org
 Description:
@@ -808,6 +812,7 @@ Description:
 		together.
 
 What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_frequency
 KernelVersion:	3.4.0
 Contact:	linux-iio@vger.kernel.org
 Description:
@@ -834,8 +839,10 @@ Description:
 		all the other channels, since it involves changing the VCO
 		fundamental output frequency.
 
+What:		/sys/bus/iio/devices/iio:deviceX/in_altcurrentY_phase
 What:		/sys/bus/iio/devices/iio:deviceX/in_altvoltageY_i_phase
 What:		/sys/bus/iio/devices/iio:deviceX/in_altvoltageY_q_phase
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_phase
 What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_phase
 What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_i_phase
 What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_q_phase
@@ -1735,6 +1742,8 @@ Description:
 
 What:		/sys/bus/iio/devices/iio:deviceX/in_currentY_raw
 What:		/sys/bus/iio/devices/iio:deviceX/in_currentY_supply_raw
+What:		/sys/bus/iio/devices/iio:deviceX/in_altcurrentY_raw
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_raw
 KernelVersion:	3.17
 Contact:	linux-iio@vger.kernel.org
 Description:
@@ -2125,7 +2134,9 @@ Description:
 
 		Raw counter device counters direction for channel Y.
 
+What:		/sys/bus/iio/devices/iio:deviceX/in_altcurrentY_label
 What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_label
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_label
 What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_label
 KernelVersion:	5.8
 Contact:	linux-iio@vger.kernel.org

-- 
2.43.0



