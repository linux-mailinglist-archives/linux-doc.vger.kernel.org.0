Return-Path: <linux-doc+bounces-61240-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4AB86C6E
	for <lists+linux-doc@lfdr.de>; Thu, 18 Sep 2025 21:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B6716F4D0
	for <lists+linux-doc@lfdr.de>; Thu, 18 Sep 2025 19:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8B02EC0BF;
	Thu, 18 Sep 2025 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uhTVDOEL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADE12EC0A3
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225088; cv=none; b=t7Wdlx5mbrHXc4LL6EIg/uXsQYjrKeqKC4cmItHKsViRKuJFHngSaty+rRXaVWAQyLFBLEvZG5vArr5X0qoYtnZGtst7b0ffglf3nppPnHiRCwvKT0COJuyXNPHgOAUGL8q11d3pjUo9lFGRpk8OFFgQIlZW/7ET0NnCWdYXpqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225088; c=relaxed/simple;
	bh=+vCpNQP3gmwChNJcUCWInLDRRa5HHP5yLhQ1psOMqTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMNDOr6aXOpabqgVnZrDaeMRUW9uBK2A4czRazdttrsnZ0M905hPxYPWru83c6tRgbV+LUFbqY/nVtrwYn0gd15MAxkRi2Cz5GLnH/VbkBXaw/Pi4a8PGEHwgwYMcb6tzRJZwkS5h67MOsfj6ipRa+8DO7A8hju8iAn1DyBaDdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uhTVDOEL; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6219e33ba2dso670824eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758225086; x=1758829886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ycb6BrVm3o3tgecg3NZ2b8GKaDVhR9xxtrfWCgsW3GI=;
        b=uhTVDOEL13vWSEZ+PHy9Gpzci9lgihjB94UiPff8m4ZgUOMFrr5L0r7eMZae+JHgHm
         Owmm7nu1rKxAgMtXT101hm6pTxVpL64qQObvWJ99wzS4ysBmGGu2ke+o4aeGLmDtWL0w
         6EoPS660WndQ4blKQujTf/FNMPzqsAk9sg+ZLKWUx0lDp3YinE1ajinBxjC4hCgY+dW5
         V6IqF7Ncryaafpgc6WTcdHN0PLvzp98GYFOW7TeQW3jORpjR1K3baX5NNbMULS1y56Ac
         fPMEm52zXPcIb5saHVoZbTll7zFao4S0n7n+T6jgjEacSeQqUe7Z/k14iE/sOgv8D2lv
         sRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225086; x=1758829886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycb6BrVm3o3tgecg3NZ2b8GKaDVhR9xxtrfWCgsW3GI=;
        b=Np8yqCO+GqY4aSMsBVc4uC2+723mdRtYMT732Q91CKi2Ns7Pt4CkWAu7jmIseCO+FG
         TQ3xrEF0LCNbk8J4K2xIyLxgH95t8IR4DrQebRH9VJ20hBu3v85Wxt/SVdSCmsbFQm/B
         fToLIlq3UIDm16ccmOS9/UD1bBPNnogNbV5SyS8F20jRgjqmDQ2z8n77PRxQ7wn4pzAF
         arpUetXEeuLoDE8kk7kK/AFQ78hM0IKCU4bCg68+/Mf09RuNib/Z5EgKjPgoy0Tdc48V
         0MOEwUsptW4Aq+4bxpAhFFC6fOed7dA5wmdann8oJA6Okh7sigHEquc+Hq2KfbRaXexP
         Ud6g==
X-Forwarded-Encrypted: i=1; AJvYcCXvHhH7VZJiQdelB4GL6tV+IMOEHjhY1hu+5v8SPu6cpZFCNs64IAe/Fk/Vwmqklgd2o/gOOSEyIU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVIOmejHe/j61LcchKnZvPalMOQfmeJ+yyPRs/ePo6DE6N7q6S
	Ji0/S/RdSzvypZyyJ3TnYt/b9xJJKzsBglV+bicbLLXOWaFouv5b8SSMfDRAK31cokA=
X-Gm-Gg: ASbGncvIeGJoUcjHTEXh7nHj3JZ+ftNT/IPB5hvrMc4r91rnmfFiNifvpTIiE2zBsT+
	AJiKIPCFgzGDdTxhzYKemJhQVlyB/o82zUqtDRcHr/vQylPSC8o1f/m/u4aBGmdgC/ir5sLGsm5
	WXofjxu35itlRJhG095F/2Svm6kBn2OmPxp6K3Eqvr5UdLFVFQoA6xWrhT/lfuZapWnf8a+Z9z/
	HahJ9VZxFToq3Gz7VVmCcbBnQgZ3L+CifUOyBr+ypxPAygnSz+rHRwB16Wml0XYY2KUCvI9WHm8
	t0t3N3xfNOUvT7mhqoGrkKyhzgpoNzsF6PT/8i5JU6pS02K2WJJYz2IT75ADBNAZOi3Cq8u901o
	RQTUYUfJZyuidVw4FWlSAW7zW608RXnNZN6PswPLCdVUcQ1RBHZQ1mJVFidZ2SsQ1w5esRDniuw
	/BKG6oyMa3e4Xe4jy/GWTNzN2uJ90g
X-Google-Smtp-Source: AGHT+IH4gnu5ZviVz4ulNiX2L97wXpeu2HQYjfDnnt0qWqu/Pap+ivM2yq37UDqW5VBY04FXNOqo9w==
X-Received: by 2002:a05:6870:8088:b0:315:60a6:c28f with SMTP id 586e51a60fabf-33bb3aa16afmr568561fac.3.1758225085748;
        Thu, 18 Sep 2025 12:51:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e? ([2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-336e3af73f5sm1892886fac.6.2025.09.18.12.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:51:25 -0700 (PDT)
Message-ID: <46575acd-9e7b-4462-989b-d74de4d86311@baylibre.com>
Date: Thu, 18 Sep 2025 14:51:24 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: iio: adc: adi,ad4030: Add PWM
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, michael.hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1758214628.git.marcelo.schmitt@analog.com>
 <7a1a68a33769c69967bcffbbf7a0bdfec69516ed.1758214628.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7a1a68a33769c69967bcffbbf7a0bdfec69516ed.1758214628.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/25 12:38 PM, Marcelo Schmitt wrote:
> In setups designed for high speed data rate capture, a PWM is used to
> generate the CNV signal that issues data captures from the ADC. Document
> the use of a PWM for AD4030 and similar devices.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>


