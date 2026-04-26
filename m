Return-Path: <linux-doc+bounces-84634-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W/GtBkwB7mmspwAAu9opvQ
	(envelope-from <linux-doc+bounces-84634-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 26 Apr 2026 14:13:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF27469C1B
	for <lists+linux-doc@lfdr.de>; Sun, 26 Apr 2026 14:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36C11300337D
	for <lists+linux-doc@lfdr.de>; Sun, 26 Apr 2026 12:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B080F35AC01;
	Sun, 26 Apr 2026 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qht5GOBD"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915017C211;
	Sun, 26 Apr 2026 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777205574; cv=none; b=DBWlEPShBJ1zePVUcvy/zv520RGLah/gaQA18GPNCRAZowkX43zOiS8zoygUKbZ7An69ebamNdE6M0+8tgXBCjW1cykfa8gaYnH8QQhoYImbBAVjJExwQW3/ZkptduKbLYP4jrOpQ5FfUgwAibE+9rNtJvPGjJ4WGH7Ee709hus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777205574; c=relaxed/simple;
	bh=P3bikrqi6kfMr6S9y79ceYVSgRZdxT9Zmg4rc+nCbqc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckIRSKVlTkF2UPXsRcJm5MetUsacRCszQGyAH9avln4j6YbPXEDCXIml9mbEez+pL+RxU1VKnvb3SNcrgID63/xucwUtam9YW+dVBzCTd8/XiZfxJHw6sTpc4apBpINwbP1zsxLKZQfQrHHJRqaX/vHQVY1C4AmYFJIxLmaAn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qht5GOBD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16401C2BCAF;
	Sun, 26 Apr 2026 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777205573;
	bh=P3bikrqi6kfMr6S9y79ceYVSgRZdxT9Zmg4rc+nCbqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Qht5GOBDsJKIkOVbzLeaeij/zPClOv+t07OmuH+t8k08Cm6kIjexA9dUY0e+LAQZm
	 4sU3ksBL+PP38nokofYDyCprUihsnsAmRPlKbN2hDc/zUE+GZG7YAVq0x4K9SCLqSq
	 QGll8xGZu81Xs5mk35WhPdyXt3jCR0fTUUOZHyqcViYzvW12SrCH5Q/oB87Z7MVG4m
	 uCILQVTDGeReL0TYiQjdzGCGb0hDlBS9VD5rENxf3AsXKd929sZOIKgAFz/WEHrmGu
	 iM5mVRD7aK0tYrHKpXffFnmlFhhkKViKvph0V+fvNO7bQz/UgdEWCOg95ORR44neSd
	 xuK35XpkzPUlQ==
Date: Sun, 26 Apr 2026 13:12:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v3 7/9] iio: frequency: ad9910: add channel labels
Message-ID: <20260426131241.7db970e1@jic23-huawei>
In-Reply-To: <20260417-ad9910-iio-driver-v3-7-29b93712a228@analog.com>
References: <20260417-ad9910-iio-driver-v3-0-29b93712a228@analog.com>
	<20260417-ad9910-iio-driver-v3-7-29b93712a228@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DEF27469C1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84634-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri, 17 Apr 2026 09:17:36 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add human-readable labels for all AD9910 IIO channels via the read_label
> callback.
Given how important they are for this driver, I'd add the labels as you
go along rather than doing it at the end like this.


