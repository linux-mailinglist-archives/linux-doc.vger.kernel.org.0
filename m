Return-Path: <linux-doc+bounces-96468-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PIMfHti7U2rCeQMAu9opvQ
	(envelope-from <linux-doc+bounces-96468-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 18:07:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F387454CD
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 18:07:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=bS5NqABn;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96468-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96468-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A12E3009CE7
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 16:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363D73446C3;
	Sun, 12 Jul 2026 16:07:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C43438BB
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 16:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783872466; cv=none; b=Kd7RpaZKod2md6utxwAfSXKY9aT3XFFGfnf5B+AW1v45MHuQ35SZPPO8+ls4NSd7NbfQY7yUiI0tlDtyx7t2jCDjN5/Ut59yO8vKQL0OfIN+6AVs3vR2sHylgWusGWHVTpCSZ4N0teWmpWEVQSQfqB6IOK3zLU1fGxvD8qUZWQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783872466; c=relaxed/simple;
	bh=/Lvsg/ZJR/lfpgoUMIiOWitMqmPb9MoVhYs6ClRrfg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jufNjZYR9Ql82O033BBmhmp0pu7ErULs7cBxUKi8T0Ply7VbyzzBaEDX/xnS3FBoR7zJjOfDZ6fIHmid33rcpR2quyOpFTy77glaLuT/rrFfaQgjxSAH2xQarxNIeV9/WyHRVupWaQrQ1xo+BK8G+MfhVyaCvetKjysDx4UymqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bS5NqABn; arc=none smtp.client-ip=209.85.160.47
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-44cedfaab6bso1071879fac.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783872463; x=1784477263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVpYadVTuJ7Oa9ZoTB5rgj6lqcEBWKLs7QhoK6MvLlk=;
        b=bS5NqABnb3IrzzCXGNzFQUFOq3VQgzYZKi+bhB+usfs5AjjguDll7xUPIPvq64mD+Y
         VZCN/PjROGVKPdWskoa3068iA253zDh6Da6mCDh1pmmOmmySOw6I/CaQJSJplgpIjCen
         xmIBp3/rG2TOu1xICOgMeFMyFYM/DvtqqkvMlVdqKvZdlxNNpI5C61GK/EblxEzFp6Ju
         RyzT4/IhGjkMraU9Y+u0RF6oYavekZxC9fxJJPcDFi+pL2pxXpDnrL3dQyR+ktGLQaKM
         uAds6MENRCW2CHoKYKDEt4MGjsE5YTeZnfPU0dGZZ4W3Tp3KXR2oep2ud39/+RsWx+1j
         qK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783872463; x=1784477263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVpYadVTuJ7Oa9ZoTB5rgj6lqcEBWKLs7QhoK6MvLlk=;
        b=Lz9hRkD0df1jHmWF/n9965SWc8OObtlxdgjVoVRwcD/bEmMoyvrtPX85mr4/LiKthP
         jXjSMcibOJt0A+69g6M6LO+v3Jz4abHmI+U53dDw17VY2fwtq0jtDu3R3P1O7kFRH09+
         MOGKUzGTy94Yv+QzEMdHURSnCkC2dnByp3W98hF+J971CGuZtmLHZ/B29UYlHk/1VORH
         HsAgWvisrvZnDObc8Etvf0tYxKGy4zpixG3w7RO1dFjRyG6xDZ6EUHwFwxFZ8T4+5IWr
         h59X7qmAjZFNV9us+D/TxiL13amhEhLgSTcJl9XO0qv1zOlxHkuB59q8K6nfVcwi/RBC
         8Bew==
X-Forwarded-Encrypted: i=1; AFNElJ/5oY6tVn5dhk2XsdXPN36hQynf+EC7ay53LzmUwxJKXclQL8xB3dItS+JD+lIDO6MK+6TO5s04oTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJwDl4+VvVVxdH4WsNws2N93qPFLfMGc5ySkSWKVUwO6GSGGA
	tVEDF/1cLQyx8OsuMd3K8vcQzPNIJrepwIAHFq6Rj4JUmXut/yJ53IXvjEmEBjL9UiM=
X-Gm-Gg: AfdE7cmfwBv0sjmupu0ZP3Sw3Cq8pCnTNt22+5EbBEdTBk3X83S26n6t5k12cEzTnrS
	gquFHKGw6U/05vN6nVGovwsHxIFv+/bUcr7dfMt3cZYMtpnKHxM3U+hU4AmIOLgZWmRE0jnDgo3
	v8AK6TnRbwM5aX5ZIhU09gtZnCqBBeHTXAjLZOuuGCowYb/qIq/c0bWQcPvwTg9schjLdT2TsYZ
	cMmuQp1SrBt58IVtDJ6veVemX1zZP0KkUObzDZjQ1ff6bbKi7hBoyg0StZ5tgYO/RtLw6tuR77z
	qKPxo1b9R6Lu+EncT6NAYBr5zIDV5vmqU0E7nZUVYxiurxA/ZVdykpscGC8hrLShVBwNUyA2Yhq
	Xd4ZLZbTa6EaWoRRC7LLWdJBwULJPgHCtGqjTlQ9laMQL4RMXf12j/WjseZ4DKNZYVFWQb51k3j
	edl6G5o3aFLP7r5IluAI73nFwlsi3MH770/R70TjygeAhMchA8di38ro3q2B69Shg=
X-Received: by 2002:a05:6870:e187:b0:449:a0db:5917 with SMTP id 586e51a60fabf-451f1445225mr2893250fac.41.1783872462881;
        Sun, 12 Jul 2026 09:07:42 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3af7:75b0:bf02:8cf8? ([2600:8803:e7e4:500:3af7:75b0:bf02:8cf8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-455c73a335esm321788fac.12.2026.07.12.09.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 09:07:41 -0700 (PDT)
Message-ID: <4b548db9-323c-4754-8e91-26ce94669600@baylibre.com>
Date: Sun, 12 Jul 2026 11:07:40 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: Add AD7768
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-1-44e1194fd96a@analog.com>
 <36df7c4f-82ea-4ed5-a4f9-3a29c75dc99a@baylibre.com>
 <20260710013322.595f8ee4@jic23-huawei>
 <a96caaaf-5cac-4bc0-9e74-e48b6fe0afc1@baylibre.com>
 <20260712023918.119fbecd@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260712023918.119fbecd@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96468-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:from_mime,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3F387454CD

On 7/11/26 8:39 PM, Jonathan Cameron wrote:
> On Sat, 11 Jul 2026 09:40:32 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 7/9/26 7:33 PM, Jonathan Cameron wrote:
>>>>> +  adi,common-mode-output:
>>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>>> +    enum:
>>>>> +      - avdd-avss-half
>>>>> +      - 1.65V
>>>>> +      - 2.5V
>>>>> +      - 2.14V
>>>>> +    description:
>>>>> +      Common mode voltage output selection.    
>>>>
>>>> Why not using standard regulator provider bindings for this?  
>>>
>>> Interesting question.  If that was done there would need to be
>>> a consumer which means explicit modelling of any analog circuit.
>>> We do that in a few cases but so far (and yup this is a driver thing
>>> in a dt-binding) I don't think we have any way to consumer data when
>>> a backend is involved.  
>>
>> There is also the regulator-always-on property, so strictly speaking,
>> a consumer is not required.
> 
> Makes some sense I guess.
> 
> How would the voltage be controlled?  Set min and max to same value?

yes

> 
> J
>>
>>> 	  
>>>>  
>>>>> +
>>>>> +  adi,vcm-power-down:
>>>>> +    type: boolean
>>>>> +    description: Power down the common mode output buffer    
>>>>
>>>> Is the buffer separate from the output? In that case I would expect
>>>> buffer to be in the property name, otherwise this should just be
>>>> part of the enum options above (and the default one at that).
>>>>  
>>
> 


