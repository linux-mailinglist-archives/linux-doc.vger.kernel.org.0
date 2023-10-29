Return-Path: <linux-doc+bounces-1345-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4B47DAD10
	for <lists+linux-doc@lfdr.de>; Sun, 29 Oct 2023 16:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B81281F2170C
	for <lists+linux-doc@lfdr.de>; Sun, 29 Oct 2023 15:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6EAD261;
	Sun, 29 Oct 2023 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvb/wDkr"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF10B67F
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 15:58:48 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F28B6;
	Sun, 29 Oct 2023 08:58:47 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507bd64814fso5102615e87.1;
        Sun, 29 Oct 2023 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698595125; x=1699199925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3e6k9aLofPBwqtOZrl9eOkhzMIksyEAGsMT8mwHRyZM=;
        b=Mvb/wDkrLCx3xmNgUd5TSo1Q0+GSK1vvjwW03vlzxaD8vGghFIHbOI+iYEEuLDBNsC
         KYxjBpsB0NT9dYWCxhp4/4PxtnwnwUkVQSHiTT3PTFVpk5E1tN/HajqGZ9odjE4Gf/bW
         +UO/ksjjzxXJ4p0yN3CEXbXypfdZFU0lkJwGgkrMwgTUN4k7CKvbQ04XZUXgUBTgqiGO
         p2d8Xcs3nrZrmnLEfYB6HeFiEAW92uerdFenbYBfknATti5DMkcpodeS2stCt+CtGK1a
         auXGtpYaPYWEK4P43+2XYpT7cStOpZSwi61OoxRZQ6dHBX07gQtvxqoLhwDaoBRcTybJ
         jpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698595125; x=1699199925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3e6k9aLofPBwqtOZrl9eOkhzMIksyEAGsMT8mwHRyZM=;
        b=FZ1MzQDbK3a55dkGqCOcsGa8EetZk9+5ou9BLZmE/yKVPNj2+eY2v3A0aRTsiJ4WOg
         SZ8t/ebQtA1bPRXCaka/c1ujdaYH5k+IqU1fQIsUc69wW0qxzfyFmgeOZiNt1rM2ksyT
         VdBa+x78st/dsGPJAbSXL3h3sdicIYu6y/iAjC+6/HewTK5CBSvyDJ41OMpn11WJ/+Uo
         eUk5y0a+1ZduTC1UVN9jm3ZxvRUKAOt6ReJwOkb/hgxkeznz3V4YjRVCjLEdDkOUEKOD
         37Dc/pCKqMrlDfH5BJpWVzZalli7/12v/L6W4ph78Nv3lpERaFL16nVi1vBkgMxdq5y6
         KoIg==
X-Gm-Message-State: AOJu0YzSwgNUNI418rfYl0y2v+AMkN+38xVinuB01BL9Gj6Vnwr3bDyd
	//PnQKCmJCcAysom2u3v8yPyw3f0IhjpCA==
X-Google-Smtp-Source: AGHT+IGdwy7SYuF6/s1PQPTMV/8CnnApzRpnqRmzo6LOWmpIsBoiqW0De7bNFLzKpreJ56RvnOLJoQ==
X-Received: by 2002:a05:6512:1150:b0:503:26b0:e126 with SMTP id m16-20020a056512115000b0050326b0e126mr7221754lfg.59.1698595124842;
        Sun, 29 Oct 2023 08:58:44 -0700 (PDT)
Received: from [192.168.0.28] (cable-178-148-234-71.dynamic.sbb.rs. [178.148.234.71])
        by smtp.gmail.com with ESMTPSA id j15-20020adfb30f000000b0032d8eecf901sm6231180wrd.3.2023.10.29.08.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 08:58:44 -0700 (PDT)
Message-ID: <576a2923-1705-48e8-81b9-f53a43c2b6f7@gmail.com>
Date: Sun, 29 Oct 2023 16:58:42 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, linux-hwmon@vger.kernel.org,
 leonard.anderweit@gmail.com, Jack Doan <me@jackdoan.com>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (aquacomputer_d5next) Add support for
 Aquacomputer High Flow USB and MPS Flow
To: Guenter Roeck <linux@roeck-us.net>
References: <20231016083559.139341-1-savicaleksa83@gmail.com>
 <20231016083559.139341-3-savicaleksa83@gmail.com>
 <c08d04b4-8e6d-4221-93f1-cf5fff8c54c4@roeck-us.net>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <c08d04b4-8e6d-4221-93f1-cf5fff8c54c4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-10-28 18:24:38 GMT+02:00, Guenter Roeck wrote:
> 
> Applied.
> 
> Thanks,
> Guenter
> 

Thanks. Maybe I'm missing something, why is the first patch
from the series not applied as well?

Aleksa

