Return-Path: <linux-doc+bounces-34-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F87C47AD
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 04:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7AE21C20D6E
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 02:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9E33551B;
	Wed, 11 Oct 2023 02:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="FOfsVGOy"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B6753A4
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 02:15:47 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51C38E
	for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 19:15:45 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-692c70bc440so4949580b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 19:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1696990545; x=1697595345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iECfGCpMxcwrOgs+tK/rI+0nJVijEyGocy239dFmGxw=;
        b=FOfsVGOyen6210JUZf6RoaLh4INK/xXaj5V0rJaAm02pRP6SfoPF9LhjkfH4KNaDMG
         y70mn9l7Gkk4LzK/WjeIxKgETTYRLt+IkOZIx9DsYj2pnEI9uuGj2NLLaZy03qIqcOI+
         F/4SZI7ImhLbJOgfLVVVaK6lixakD+4+zwQz5EoYeHLhAO/6vW+2fqD26xsiQzMZU4PK
         3udg3Usvl/HMo0shMJPW2fDDzuS3x5tc/g8P4VbwjvxsInHMDcrKJ3UFyzom6GWCYO3a
         aptnO4MiS+NmtpHpUm/alr/jyjiD2QoTIerc/pEKVlqxcI7cl5yEkC5yJK16+AmdXaHQ
         htyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696990545; x=1697595345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iECfGCpMxcwrOgs+tK/rI+0nJVijEyGocy239dFmGxw=;
        b=BiVMWG7cUql+1v1PlrYZjc2+FeVrlAm6P4TfWz71SHRDWNRn3sVdCMrQF/7uZAUkV7
         gxURMbUbsLL5rgYVFE4pTaxf0Soy8+T2vEBbOdDntsvyptMywwSUBuaPOVIa09izesU9
         rqxdGFNYK0PbZl2ZVp+ZIzkssCwy17MSwd9R4uAOY5o8X3gj7+vgpeQp9ovfqvcgjC3M
         7YqWQRHXt8bnj4LHbPrXlVxHB2GqYQjVgTNSeInr3O8P+UPeKMrqX5g1tMiWBYpVkEaf
         CCRgwcSkucADDqHlVkTeEngXEmSFj5hUFeJ9PhwHbYoipWQ3IoNSEmVDYuyH6AJn7Xsv
         K28w==
X-Gm-Message-State: AOJu0YyORTxzaajTNKM1jvUvMmeBPjNwMorhHInZKvcDkPqb8y764wYl
	0N/3ssFjiOH4lZneaQmJ2lvhUQ==
X-Google-Smtp-Source: AGHT+IHm97r7d3gBuXSWs26WG7XXCFQuF+p7rtRB/I0tH02ivL0P9H4FSQmQz0CNE9SoZk9IC3noqQ==
X-Received: by 2002:a05:6a00:3a16:b0:693:4143:5145 with SMTP id fj22-20020a056a003a1600b0069341435145mr20705305pfb.31.1696990545282;
        Tue, 10 Oct 2023 19:15:45 -0700 (PDT)
Received: from hermes.local (204-195-126-68.wavecable.com. [204.195.126.68])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78385000000b0068c90e1ec84sm8959795pfm.167.2023.10.10.19.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 19:15:44 -0700 (PDT)
Date: Tue, 10 Oct 2023 19:15:42 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Yuchung Cheng <ycheng@google.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, KY Srinivasan <kys@microsoft.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "dsahern@kernel.org" <dsahern@kernel.org>, "ncardwell@google.com"
 <ncardwell@google.com>, "kuniyu@amazon.com" <kuniyu@amazon.com>,
 "morleyd@google.com" <morleyd@google.com>, "mfreemon@cloudflare.com"
 <mfreemon@cloudflare.com>, "mubashirq@google.com" <mubashirq@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "weiwan@google.com" <weiwan@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next,v2] tcp: Set pingpong threshold via sysctl
Message-ID: <20231010191542.3688fe24@hermes.local>
In-Reply-To: <PH7PR21MB3116FC142CAECCD5D981C530CACDA@PH7PR21MB3116.namprd21.prod.outlook.com>
References: <1696965810-8315-1-git-send-email-haiyangz@microsoft.com>
	<20231010151404.3f7faa87@hermes.local>
	<CAK6E8=c576Gt=G9Wdk0gQi=2EiL_=6g1SA=mJ3HhzPCsLRk9tw@mail.gmail.com>
	<PH7PR21MB3116FC142CAECCD5D981C530CACDA@PH7PR21MB3116.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 10 Oct 2023 22:59:49 +0000
Haiyang Zhang <haiyangz@microsoft.com> wrote:

> > > If this an application specific optimization, it should be in a socket option
> > > rather than system wide via sysctl.  
> > Initially I had a similar comment but later decided a sysctl could
> > still be useful if
> > 1) the entire host (e.g. virtual machine) is dedicated to that application
> > 2) that application is difficult to change  
> 
> Yes, the customer actually wants a global setting. But as suggested by Neal,
> I changed it to be per-namespace to match other TCP tunables.

Like congestion control choice, it could be both a sysctl and a socket option.
The reason is that delayed ack is already controlled by socket options.

