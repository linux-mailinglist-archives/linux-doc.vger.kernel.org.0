Return-Path: <linux-doc+bounces-94020-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z7ypK7KQQmpb9wkAu9opvQ
	(envelope-from <linux-doc+bounces-94020-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 17:35:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B66DCBF4
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 17:35:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=mJaLXTBL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94020-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94020-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E220830D7FCD
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 15:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B461743DA56;
	Mon, 29 Jun 2026 15:25:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AB643DA40
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 15:25:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746742; cv=none; b=pcSKNl1vXfYyIKJpJfGCLnTbFWt/TYC05m+kU6rKGOBS7Q87XRd0tAB0rFCKLrSuyoHkkyiwCoKdshTNAbUuo3M4+zcKCMcQgJ1iAUQxsz8OiQYSE5e4lTm0jjQ3/SKs8HXws26ACTLNn7NQmwtE4UXfrHeF9OuYQC2/+Yg0ZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746742; c=relaxed/simple;
	bh=bMEqNXZ9mHubK+aM6jy3pBJZxkKeyMW8AyvCDDB+Lrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7+tJgRl8bUaeYyOaZS4dtzeLeC/lb89h34raCpgt/zLdUTXBu52eQkoZxfTa/fMc/2FRjViW1qNWhfb8qKG/A9eeINRD2P5A5ctBkP5GO5fkMd6koAFY89O718O4rNHmYGTVhWc0OksMMNNbAXsww+3zOboHOJxtkiwbKnD8+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mJaLXTBL; arc=none smtp.client-ip=209.85.160.44
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4486c5813afso661043fac.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782746740; x=1783351540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaJaAgaoRCLCjD+AlsRhR9FrqAL4y+0Revc/YO4kdQc=;
        b=mJaLXTBLa1qxGRMHQu77viTO4XIUoCRPMKffn6Frhl+5jxJuXvfhWmKOKLWFtpX3Pq
         6X5ukd4WrfEay3JhK5jUJ9HkVhQ2QrBsnXW3BgscFG95s5xJJgcswBGiJxFiZG8iphwy
         miNpmJs3NhOy8nYPpfH+YJ+MKLXGomTyMRfd1ihBvymSHnOTLbunt/Q6iUpgmw7ZTDoq
         vpjseUl3AKApgG1Gm77XvO+Q0vos+Vi/M1fir6bwwlNRBimriXLFJ9eGIkbJhayPIs7E
         rVo22cdcFtJLWF39Qo1T7JWSlgqA7XTQ7GNaNAavYX5pztGqX+zi4rrG6ek+MEzcrsjX
         k6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746740; x=1783351540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaJaAgaoRCLCjD+AlsRhR9FrqAL4y+0Revc/YO4kdQc=;
        b=TlKK06Ool4L4+Q4ZrYks02gEEhbIyN61HbZn0wucn4NnmAuGvY7Z6Ro8fY+r4brHNe
         Svu+WxNZ4gPuYqivCUaCK1/L6NS7b6G3T9ZJphiZkMiCGILK9N2OJnzPKdS8iO3wBkU8
         xh+pR0szvoIU21Ujl3xecv0QD3AHX0HSAMHXtke1lX1D5SQAH/yIUDzk7BVpXLltI8r7
         LO632HxjcF0u32d1v0mv9bj+YohmWMNliWEPZqcSB2S0WhfoLl8ZA6hFOE4VaYbfhO51
         jgd9EBgo14OcfjvLcoNwxWQcCLM9H1CvVj4sXl/qMHMusqG1/UaL0aFchz9QeFc9c+Gp
         PqSg==
X-Forwarded-Encrypted: i=1; AHgh+RqLqfF32ShuylIHKo1cdVX9oFpREdWe+gTjfdOBqQFfVnXe+Xj1skL9zHjFKkjsy2pPVlfyAf9ouBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLKUO3rnKTk7Wxnov6uqTOegAl392LAASqWop0HpsLcMtDNmNp
	OnqKAD1C+38YCInYd4xwNDDvSeDAKt7K+FmS96EMAl+1FZchWlUT2+BCQFrtRg6pD7Q=
X-Gm-Gg: AfdE7cnEmO7PoX/BxBtG+z+SZTyKGcJCCKOnUQAwYOpgvTP7KFGkL1HjSeUMHxEkLj0
	0Is+10EbgSNsg3NDc4OjqtqmiCRVlippmqYBGoA1X6Oi3UCzKo5mC6tz3EsvEIB8wR2DP+H/dvk
	LwJrMv3jLIA4xRDnnFWz4BK+ZBA5JzVRm4jWrnXOLef3YlkGrmXg0xpcW6toNTN8nsW/m5ysZKG
	vPRNH5FQhh8QeAZBhG+aK+uN3zlwB45sfPh79DZ9egJP5+4NOT5fPTOv8chFEmKqu36qm4xonaN
	h09MgsrQ1wp4nHG941BxOT5pu+hhmq2mXc/YqLVdZlHOTb0Njj7H5UryEOcvxKaJp9uXaIamRCO
	lHBGFzcJWu7GCyysfzj4ztMlUEIpt54oYP7XP0D7o4Nzat5nbCldQOo5vB8U/YRJW/HWzFEcsOm
	A64IQ39KYoptROIWdLWqk5bMetRS68+b1tSfWsoZo1QGFj3kwZLHz04YF671eHnn8=
X-Received: by 2002:a05:6870:9693:b0:448:6e54:4819 with SMTP id 586e51a60fabf-4486e544f3emr4992977fac.16.1782746739826;
        Mon, 29 Jun 2026 08:25:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbb2302csm70720fac.7.2026.06.29.08.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:25:39 -0700 (PDT)
Message-ID: <9b179166-3057-4867-be04-b071a809f70f@baylibre.com>
Date: Mon, 29 Jun 2026 10:25:38 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/5] iio: add Open Sensor Fusion IIO driver
To: Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260628191337.937-1-kimjinseob88@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260628191337.937-1-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kimjinseob88@gmail.com,m:jic23@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94020-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:mid,baylibre.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C5B66DCBF4

On 6/28/26 2:13 PM, Jinseob Kim wrote:
> Open Sensor Fusion (OSF) devices expose a UART/serdev host interface
> for a sensor aggregation hub.  This RFC adds a Linux IIO driver that
> parses OSF frames and creates IIO devices at runtime from capability
> reports provided by the device firmware.
> 
> When the corresponding capabilities are reported, the driver exposes
> accelerometer, gyroscope, magnetometer, and temperature data as IIO
> devices named osf-accel, osf-gyro, osf-magn, and osf-temp.
> 
> This remains RFC while the binding, protocol subset, runtime discovery
> model, and driver-facing ABI are reviewed.

If you are just looking for review and don't have specific questions,
then it is time to drop the RFC.


