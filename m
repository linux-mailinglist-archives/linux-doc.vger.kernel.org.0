Return-Path: <linux-doc+bounces-30572-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885159C5F5E
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 18:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B9862818AC
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2024 17:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3D21FF5EF;
	Tue, 12 Nov 2024 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fLW8F3Nt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEF92139BC
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731433529; cv=none; b=imacbrdvJRw0Rf9dgi04f41DSDHpu9pLVwK5XFSkOmbtlqjqRk9K2xjlVObwNIfQSB3Qj9kaiFsxwIHGtqVF2F3pxXWbPhticsKIyPWpUSV9xDU1+DotxYHeVMu87AzjhZImixRk/btm4xrRKjDCCL4kQPDg2f/bbl1K4Zujl2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731433529; c=relaxed/simple;
	bh=Yinkl93UP/31pxFUSB5Jq606xcPJ8D/z+uVQsMOQcyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHufdTVVJoC4mkcxfbq/1q2IrXP6nPMRedFoVHb7HTsm5eq2m6ijq6PNpMPT20SAP7D6Awojh3lJCwfrLYWNThgoeaEPUY2Yq8wyM8BJZQvzM1zVnCEccrGbTFMzGEpLqljU9PtW+nnUMGBZomvpOOnspsOctDaj/NxztGzQKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fLW8F3Nt; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a6bd37f424so23174235ab.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731433525; x=1732038325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECpNk3WVDKxbHxhK0N6QRh+9W6qmtXb+Bcm8kSS24fI=;
        b=fLW8F3NtUDwUF7UCzWAkc21yOiJDrpEPyFTGXHJhUv3375KRhG14yIQLr9OgTG4cFE
         i22GKdcD6JI/bsgmu+nSPC4DIfFuJtynNy3IvAmUlZwrDPzzYcB3PnsKvFKvky6dhr58
         odzzrWHMqGjGLj7rjmZtNvoqp7/As+zQiioiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731433525; x=1732038325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECpNk3WVDKxbHxhK0N6QRh+9W6qmtXb+Bcm8kSS24fI=;
        b=hEeO3l1eng3rHg6ayom4U0fjFLkDlHxFtdYimIR7UqR6vmI2clqpODw5KUDO3MVLN6
         7CCV8l+EgwvXu5Yi+TxPr+9VJfJjYpTwnS3m4rmXi4adFFpyV3TLzh9S3KCYxyh9Jg2K
         fbMzoFkRdjRjPOO+BbicSITvqp+PDYPrgHwb38B+36mkn5OQ5BRuqDDicsoXg1K6BEFo
         qzwJGAcfX+PanS58mIpSTalFAJBdMBc8rzMGWn1UKzqwC5HzUhJmUs0PhNL87zlSThrR
         HFCHLjlcX5pHgnE4/Zg+lvOL/XfAEHX/xNflePMG1UIBPRrV6PzQDiNeUMyCOF4BAimK
         OV3w==
X-Forwarded-Encrypted: i=1; AJvYcCVCiUBtYKMn1NjKsZjXvSJ9bmX9J19K8bmemg9xDeMhPxoUq0gOeaKBBZzaspDGlUvHfy7k4ZfTmhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBgzFwC2dptG6KA0tuDhhIF8cGemHGqrrR7i1mOvG5pmixvFR
	d6CXItm9aybGeGhTZP/EVudIToQooVIX+yUf4a+O8Ji+9Xu+Ypx1k6xI8KRjaso=
X-Google-Smtp-Source: AGHT+IEcXBAYv4/mLCHfvUtLQLJl2VENS1NC1IgYaxRc/OxGwWR3LyGd7ehckrw2AjOPHQRtvikMZw==
X-Received: by 2002:a05:6e02:745:b0:3a4:e99a:cffc with SMTP id e9e14a558f8ab-3a70c895f97mr41435405ab.20.1731433524938;
        Tue, 12 Nov 2024 09:45:24 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6f984856csm23083155ab.44.2024.11.12.09.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 09:45:24 -0800 (PST)
Message-ID: <d9bcf2df-8201-4eea-8e98-d305a4671736@linuxfoundation.org>
Date: Tue, 12 Nov 2024 10:45:22 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for unacceptable
 behaviors
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
 <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
 <ZzNppQIQm6O6lnfW@finisterre.sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZzNppQIQm6O6lnfW@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/24 07:43, Mark Brown wrote:
> On Mon, Nov 11, 2024 at 02:50:45PM -0700, Shuah Khan wrote:
>> On 11/11/24 13:07, Simona Vetter wrote:
> 
>>> Personal take, but I think a forced public apology as the primary or at
>>> least initial coc enforcement approach is one of the worst.
> 
> ...
> 
>> This document isn't intended to be a complete summary of all actions the
>> CoC takes in response to reports. There is a lot of back and forth with
>> the individuals to bring about change before the CoC asks for an apology.
> 
> I guess it would be good to explicitly call out (possibly in an
> incremental change on top of this one) that the specific enforcement
> steps here are examples, and are mainly for cases where a more
> mediation/education based approach fails or extreme cases where they're
> inappropriate?  Neither the existing document nor the current change
> make that explicit (at least to my reading), it's clear from for example
> the reports that are sent that the existing practice is to try to use
> those approaches first but I'm not sure that people would realise that
> from this document alone.

Thank you Mark. I will add more content to the document distilling the
discussion on this thread in the interest of transparency.

thanks,
-- Shuah

