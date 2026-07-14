Return-Path: <linux-doc+bounces-96716-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U+Y5C48XVmpGzAAAu9opvQ
	(envelope-from <linux-doc+bounces-96716-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 13:03:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8352C753B48
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 13:03:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="azp+4xt/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96716-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96716-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2E6730DAB04
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 11:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB0B38D416;
	Tue, 14 Jul 2026 11:02:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75B380FE7;
	Tue, 14 Jul 2026 11:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026973; cv=none; b=TZsE7HnDUUbEshU5ORLOCE1nGt0jNbF7hFZ3lBNvP9DOcj5Tf96cntmCNFN85wicpXM8fWJmh0gs7G6DF7UN7Dm2mAV71lrfzyjVFXmMCFU5xpMjfW8jypTcpZ4NVpLRdfaWCUqtddeXy13vlSX+5gSaj2vN2CQtu3cMkzSX0/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026973; c=relaxed/simple;
	bh=5X2Ye7V+h+u4pOI03KSzCN+e5fKvlRFKmRzAEhOXp7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+uS9O9src0kxI9a051VnPuUX9oTA6j/sNXkIPO11nAZjE71TziWWDdUQf+O0I2F0IXh26k1BYnug3Brpe8K3quqv7bL999zj1iSqMcVPtYWV8y+PYFLY0tQQfPhmECTHaVJcD1NkI5mE2R8mmwXalxGyH1E7Mz6slC957blHLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azp+4xt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C34ECC2BCF6;
	Tue, 14 Jul 2026 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784026972;
	bh=5X2Ye7V+h+u4pOI03KSzCN+e5fKvlRFKmRzAEhOXp7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=azp+4xt/ov0JBSofcVEuV6j5IZvY1aWDtangB0x59hVf5kAjfv0aQBz1h8rtReweY
	 dbKcWum4z4vSRuPnfUb35j3sEBnqwcmLNg+jITD6VSsSa/AhoDQ40IQ3nQS1u3mFIA
	 lpI3BrqbyI2GOlzgGDceCDT/H1B8aqN6M9b/ifHUx21mB70zwA/ZjDfd11coBsFAFD
	 M0RU0Q7e12fSBZsWO1molFKBTchwoT2dFyV25okZXTno6Z1PBQw8qq8hfHFGcod4r3
	 y2Ss1ifal0ouR1aui86y9r+2YxbRptRBQC2eVyQLWPPoLAAfWYMSzntEiGz5+zX0f7
	 u5OTq2PABax+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A304CC44509;
	Tue, 14 Jul 2026 11:02:52 +0000 (UTC)
From: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Date: Tue, 14 Jul 2026 12:02:43 +0100
Subject: [PATCH v8 03/17] iio: ABI: add parent entry for iio channels
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-ad9910-iio-driver-v8-3-36939c3c07d2@analog.com>
References: <20260714-ad9910-iio-driver-v8-0-36939c3c07d2@analog.com>
In-Reply-To: <20260714-ad9910-iio-driver-v8-0-36939c3c07d2@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784026971; l=2431;
 i=rodrigo.alencar@analog.com; s=default; h=from:subject:message-id;
 bh=5nFgyUfllJljSZOQwdty2yaZdYRSoVEDNbvhxaPGuQ4=;
 b=+sZGmCIyOZ0XlZx02qZz/e0hX2dfkibia59XxSpalI66NtGBbE8Kqp09EbtgURJnYp7HljDjb
 sF1J7XnEFkxDTAIRHrl8w04kp4anSARdWCsoE71DSQsJHJWZd+5yXlW
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96716-lists,linux-doc=lfdr.de,rodrigo.alencar.analog.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,analog.com:mid,analog.com:email,analog.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8352C753B48

From: Rodrigo Alencar <rodrigo.alencar@analog.com>

Add documentation for a read-only sysfs attribute that allows to expose
parent-child relationships between IIO channels.

Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 7ef0db8dad40..96a7991c0723 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2155,6 +2155,34 @@ Description:
 		specific attributes. This is useful for userspace to be able to
 		better identify an individual channel.
 
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/in_altvoltageY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/in_currentY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/out_currentY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/in_altcurrentY_parent
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_parent
+KernelVersion:	7.3
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Read-only attribute containing the sysfs name prefix of the parent
+		channel for hierarchical channel relationships (e.g. "out_altvoltage0").
+		The prefix uniquely identifies the parent channel and can be used by
+		userspace to organize channels in tree-like structures that reflects
+		virtual or logical relationships between them.
+
+		For example, an IIO device may expose a primary output channel as
+		"out_voltage0" together with a set of profile-based or mode-based
+		subchannels used to configure or compose the output signal. These
+		subchannels may carry common attributes such as frequency, phase, etc.
+		They do not represent physical outputs, but rather logical/virtual
+		channels grouping configurations that affect the primary output.
+		Each subchannel exposes a <dir>_<type>[Y]_parent attribute reading
+		"out_voltage0", allowing userspace to group controls under the output
+		channel they belong to rather than treating them as unrelated top-level
+		channels.
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_frequencyY_raw
 What:		/sys/bus/iio/devices/iio:deviceX/out_frequencyY_raw
 KernelVersion:	7.3

-- 
2.43.0



