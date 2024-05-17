Return-Path: <linux-doc+bounces-16459-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B867F8C866A
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 14:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 359F1B21CA8
	for <lists+linux-doc@lfdr.de>; Fri, 17 May 2024 12:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B22F5026A;
	Fri, 17 May 2024 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="KGHJFSkZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047784C3CD
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715949794; cv=none; b=bzwJp7EpNgVGndGGGvd2nCss/p+XNv3fWDBYwTSaVhoyFVl+kBmDZsBnatXlpGzztoe5hnYO1BzhWrIbb4RvE0G63F+j43/N4E0remYWudLf03np+klggYgVsxZt+QPk0WrGyEg/GcRggH/13IjOlK6jj7DPkvuCsFICiRbCbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715949794; c=relaxed/simple;
	bh=f/aQOdnb1qPEH9OPOG9Jgx9mTvP5LMcSVmCzIweEKcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJyGewwixIuTwYaIUvS2orn/WlA4rOIUfcIAQz9KTc8rb28TMjl+KZazgY1TfUAGvS/b/l8H33jFdz43zTleqqMR+2LCh7G5fhJ5EdTYJ0ifTl3YlLhrwWJ+77F9tngl7hcYZP01f1rSEEYKaL1oLI4op7ApkTZ26tWueIYuc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=KGHJFSkZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-520f9d559f6so2479599e87.3
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1715949791; x=1716554591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4odqj3f1vqFSZ0CAbdMnpDHtOEgc8xX6bxBAUOmAh0=;
        b=KGHJFSkZBV53d++jQ1dEqv+eW9/uhHtCxw1KWs4ZM1Fm8BjGMUzIsI4k/kxPTNT8FR
         2mZbVn1Q9i/Nq9sCc2VWbwQUPvPpgCYFM/16hBdnsGyiQ19KZWW/9BW/t5wGhi9CKnZv
         qxzBAsCX7dDuEbyOeoEiODn1cLDoXxHozyhm6F9aTWZx539irLHpqD6hltpZ+YHov8Yp
         2lxSn0GzrynNx70oEALFBX2GL2EAxdDiqxCjlYaHT0323vh3+3nouy+SWLv/LJOO+cx7
         GNJtupif8fCR7sIqcUErmOo0E9m5eTU0c63rxfJ82Sk+BaNN0fD9tNNR9+f3ufKf5Zxi
         psZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715949791; x=1716554591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4odqj3f1vqFSZ0CAbdMnpDHtOEgc8xX6bxBAUOmAh0=;
        b=jtRipRTkImH4bJnSd4YkWfX+xq4N7j1AuraQgfS3L6kO3I0Eez7zXld3qkoXFdd/BQ
         UcZ9yC4V3NL46Aec0ilR0wNHQGBCqqaH6rcENAQFjZ6l4uwV5mcFhcWMFw02Nff9XF/P
         fsbJOyhbG9Q7dmY156Xlhb8qrbvSrUTtMIUVK8jQvqyH5Z3Uf7/qrBPfyXsOovm2lubK
         rNnlq/L6V/TKWnYcHWI43eGfoI1u7dvd+kssBKovb4tpDtUX0RLckR3aZP25GDRklDEQ
         6cL2eFSvXwIwVt7+xPx6HbrmFsNDVxkkBXpPKjEwzoe6+08vKFodtkmKk5z/ejvwIm06
         gBww==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6k90EO/l/vRAImw+MEBLgB23eyZPJnxo/WeesAzhqkaS9ufdL01hkda3tdPXjdytF0Gj00eTY81LKBspIc6Csl8gPHwY76U8
X-Gm-Message-State: AOJu0Yx87j09uiJnU3uUIHgx/w+eAtWgKExu1dQhn0+sgpPZxocJaMZk
	icVqpsIqRY5gxAl082XIDYFbQKMdCiEDG9TxRBR3Lbx1QA7bkeRIRudWiPCaHuc=
X-Google-Smtp-Source: AGHT+IHp9p+FH7l3Piksd2SYumeoLKxIBZc1FxIo8Hbs5SbDaClaDIaOn332eu7c17A4SWqlURItxg==
X-Received: by 2002:a05:6512:124d:b0:51e:f2bb:158a with SMTP id 2adb3069b0e04-5221006cd7cmr15851334e87.64.1715949791256;
        Fri, 17 May 2024 05:43:11 -0700 (PDT)
Received: from minibuilder ([185.117.107.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba8f1sm3340928e87.85.2024.05.17.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 05:43:10 -0700 (PDT)
Date: Fri, 17 May 2024 14:43:09 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Parthiban.Veerasooran@microchip.com
Cc: andrew@lunn.ch, Pier.Beruto@onsemi.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, saeedm@nvidia.com, anthony.l.nguyen@intel.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Horatiu.Vultur@microchip.com,
	ruanjinjie@huawei.com, Steen.Hegelund@microchip.com,
	vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
	Thorsten.Kummermehr@microchip.com, Selvamani.Rajagopal@onsemi.com,
	Nicolas.Ferre@microchip.com, benjamin.bigler@bernformulastudent.ch
Subject: Re: [PATCH net-next v4 05/12] net: ethernet: oa_tc6: implement error
 interrupts unmasking
Message-ID: <ZkdQ3eEfvikTavwZ@minibuilder>
References: <ZjNorUP-sEyMCTG0@builder>
 <ae801fb9-09e0-49a3-a928-8975fe25a893@microchip.com>
 <fd5d0d2a-7562-4fb1-b552-6a11d024da2f@lunn.ch>
 <BY5PR02MB678683EADBC47A29A4F545A59D1C2@BY5PR02MB6786.namprd02.prod.outlook.com>
 <ZkG2Kb_1YsD8T1BF@minibuilder>
 <708d29de-b54a-40a4-8879-67f6e246f851@lunn.ch>
 <ZkIakC6ixYpRMiUV@minibuilder>
 <6e4207cd-2bd5-4f5b-821f-bc87c1296367@microchip.com>
 <ZkUtx1Pj6alRhYd6@minibuilder>
 <e75d1bbe-0902-4ee9-8fe9-e3b7fc9bf3cb@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e75d1bbe-0902-4ee9-8fe9-e3b7fc9bf3cb@microchip.com>

> Thanks for the consideration. But be informed that the internal PHY 
> initial settings are updated for the Rev.B1. But the one from the 
> mainline still supports for Rev.B0. So that microchip_t1s.c to be 
> updated to support Rev.B1.

So I figured, thanks for making it clear.

> 
> Also I am in talk with our design team that whether the updated initial 
> settings for B1 are also applicable for B0. If so, then we will have 
> only one updated initial setting which supports both B0 and B1.

Sounds ideal if one init procedure can cover both chip revs.

> 
> Do you have any plan to update the microchip_t1s.c for Rev.B1 support OR 
> do you want me to do it? If you want me to do it then I will prepare a 
> separate patch series for the support?

I'm keen on taking a Rev.B1 chip for a spin, so I'll jump on doing doing
the init/fixup. I can probably post it to the mailing list during the
weekend.
If you're planning on being faster than that I'll wait for your
submission.

Out of curiosity do you have any insight into if the rev b1 is expected
to behave differently?

R

