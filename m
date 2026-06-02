Return-Path: <linux-doc+bounces-90430-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPolBfBGHmomiQkAu9opvQ
	(envelope-from <linux-doc+bounces-90430-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 04:58:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB40627792
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 04:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 441BE300C0CE
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 02:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61891368D52;
	Tue,  2 Jun 2026 02:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AFco6wM+"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807D364E81;
	Tue,  2 Jun 2026 02:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780369129; cv=none; b=qpOglaXumQBNaF4zSwIH+UNhQQlhUNee7FP6Vz1k3aawM1xAbdcj97zh8k2rpTp6/VCBzMWYGX/JhG0lZUqH8pObAhVSgqvT+5Hrh7crC04gKgwTJchlPhOhIP5WgVDSAo3hn+hKMukyUKV2rlZBd8WKXg+UBX4Cum3qQFs5ZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780369129; c=relaxed/simple;
	bh=53Cp5+xc+DYElUKvXrlzk3pn+leisi31D9Du/yr+gIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiKh3rpIgqZEgCg7E/IZQgLsnZCUx34O3YyeIRLVOfli3tmPFLvtx7Bul9sX9OQecpKgU0ucGXxTW5twYtd4qVd/UEh3ZAZw9SmH5UNdnYsfGv2cOc6dHUCYctrWV6lxMsJwgHhkEfYbTA90NRDvhgQx8k7ixPHeMmRwBEZxTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AFco6wM+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=V6Fwgi6SxT306fVnfWLu85I0FmoYducjBMjSrjw4plo=; b=AFco6wM+4kKsPd/RxOZ3WirD18
	9wWXZAPaGaw5U/2SNlcoFUWOtWzzTv+FdpGYnm2N5u9z5ZLjxaPtmW0gFl5UTlrT7xqh2sflbVmvr
	QLYojwuJKnNZTsUldMYtFCVPzT/mryE6hzvMJ72K8Joa/m8dWtpbEVgNe3GoYa78GIk4degkjjcmW
	vRpHMwYGl+bHqjqZ/gDvjOxZpxc0Lr+ck8nTnLxQ79SpdVDFCCT7UfU3GGx+Sec1ZJn7Oj6TxHRtm
	nHDVFe/gMe7lJBLHVkzL2wfWTgrZ5XugVyS1P8W1NTMFvTJWkDqqRIv3XZV+r1ymfyA2U7LG34Zz7
	L9Mt6MVQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFL1-0000000CCc9-0zZn;
	Tue, 02 Jun 2026 02:58:43 +0000
Message-ID: <a597f215-6ec8-40e7-be5d-9e765a87f639@infradead.org>
Date: Mon, 1 Jun 2026 19:58:40 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 11/12] docs: iio: add documentation for adf41513
 driver
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-11-da09adf1c0dd@analog.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260531-adf41513-iio-driver-v15-11-da09adf1c0dd@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90430-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2CB40627792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/31/26 1:30 AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add documentation for ADF41513 driver, which describes the device
> driver files and shows how userspace may consume the ABI for various
> tasks.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/iio/adf41513.rst | 199 +++++++++++++++++++++++++++++++++++++++++
>  Documentation/iio/index.rst    |   1 +
>  MAINTAINERS                    |   1 +
>  3 files changed, 201 insertions(+)

-- 
~Randy

