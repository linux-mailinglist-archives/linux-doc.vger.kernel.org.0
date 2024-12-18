Return-Path: <linux-doc+bounces-33176-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634989F6C0D
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 18:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A518A189442D
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 17:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78A81FA158;
	Wed, 18 Dec 2024 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="IV/euG4g"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E12B1F9A98
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 17:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734541744; cv=none; b=qYP/IlLBZVA95ZIM7Y+ENRpRJ8WOZeFcdvEjMUPt4EMCnnFQ8upKHIUrtJsA+pQICkDj/KcyNQu+2S+ORYUX/Jct9E3/OjevRr5zHJMBF05tMBUlcTJarW8s4EjcVL/rHFvEhTabU6dBuuT1ccB5VHzDqZI4+FqfF0rkmygwPtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734541744; c=relaxed/simple;
	bh=EsxWV4j978n0te6a6W9t6wV5YT9GBp7l9URdDS6SmgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7x+jDWsxBwy2SAvC7K/mEEhqJnI1kiP4J61kEG+DbrAs+Ms8N+6dF5gj8b8RpQYeOT36rh/KqpVo8j09EYKLOM3GJKF/GxBblTfzj2nZDerMyJkNbw3vn1cPVZJeW1a2enlBlKgSGWLN2g8KxjJdcwSMZq3mvloejN8jqOQcOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=IV/euG4g; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165448243fso66481565ad.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 09:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1734541742; x=1735146542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpSQHZ9ybTyyNY7KNiD5NhxYslOMfBGaz48YVmHE+bA=;
        b=IV/euG4gfobmfFkIBHK8MQiPRiZH1OKuhIulETaabf0x0LLzxrdVh6g0CzWJdQAa+m
         eyjLBpSgoK7HQX9WDvrQSksuPadoe0dcVGA0DIc7Gvg5ORYka+nqUNVbq71XG3eJDXZU
         tfj5R69tKt47QGmq2KCxFPGshEnFTTL4a+XwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541742; x=1735146542;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpSQHZ9ybTyyNY7KNiD5NhxYslOMfBGaz48YVmHE+bA=;
        b=or6/V6VY1LqbQCabc6wicMYjiIW6kc2SDkahvUYcnLW9ORqK3QSM5k2+ezbbvnnyGs
         QwlJM8sbnC0axku+wYhH3shKV0MzgCShfiB+aHuHVZV4VCiL7w3xwIbjh637oDRmKUgs
         lmN6na958svdiaXsQwQbW3kT8NWstCFCUGnFTrxAaxkPk7eqZ9F19kvBzRYPN8hCNTpO
         jdQANAiVY2jjVfPMt5MoOgolUiESBH0zX1K6II1Oy4o87CeCVj16ycd0KnuE2HhEX3hS
         MJYnn8NBLhxkrnfBbCK9GwKSrGNGAIHEBP6mKxhik7XhIBgkdJgk8fso1vfASTnvQQse
         rD2g==
X-Forwarded-Encrypted: i=1; AJvYcCUuVmMZ9VXNaDM1sou1Sfx+JNkCNbIx0E25XA8touFAR8R5BvJZy+mvyICfGI36au/2kW2fFV8o8P4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwryEhfEoD2c4N0fN8JARwDTPUKcHup0Gl8yeymBi/5baWKRqKb
	LD+Tos7fPne0Is8a9k2eRG3CeCO8xQlL8wiC76WAiaC0iv38xX8XhgScoehY4/Q=
X-Gm-Gg: ASbGnctjgNuYD20PYOPSqnUxaJixedQO7bw+J9xgKVsYhPjJqzZueLLuH4+Qg6gsCpX
	LcIA4wTgFk1C3nPR3+kHAjf3NMVVXEOT1Uur4CrygcNrIXEhMZ9rFRFNnKTOuADoe6K8au1KUe9
	UPIGSWqUbWhNFtudYXidQt664iiLp7H+hn2efaXtFlCArOiYMee+E3dR/L7Lld2JO6QJ3H8yyWz
	9nmRFcRCUDC1s3LoRmWMmXlYNEfMHflWNmacjAqpFkjJ5eTSEcQ77mk+EQ+1uc9+ifKdtFpnfmS
	9GVasqp+2e00wAAzpVK/l6Q=
X-Google-Smtp-Source: AGHT+IFLcXEwr+Ux+NRuBtnQUxHIcEJMXQFYotalRPkLUZD05Hvov4X94huhAnS7Lo6myzNs/HTYKw==
X-Received: by 2002:a17:902:f985:b0:216:6c77:7bbb with SMTP id d9443c01a7336-218d70dc242mr38520155ad.17.1734541742613;
        Wed, 18 Dec 2024 09:09:02 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db63c3sm79259875ad.48.2024.12.18.09.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 09:09:02 -0800 (PST)
Date: Wed, 18 Dec 2024 09:08:58 -0800
From: Joe Damato <jdamato@fastly.com>
To: Alex Lazar <alazar@nvidia.com>
Cc: "aleksander.lobakin@intel.com" <aleksander.lobakin@intel.com>,
	"almasrymina@google.com" <almasrymina@google.com>,
	"amritha.nambiar@intel.com" <amritha.nambiar@intel.com>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"corbet@lwn.net" <corbet@lwn.net>, Dan Jurgens <danielj@nvidia.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"donald.hunter@gmail.com" <donald.hunter@gmail.com>,
	"dsahern@kernel.org" <dsahern@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"johannes.berg@intel.com" <johannes.berg@intel.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"leitao@debian.org" <leitao@debian.org>,
	"leon@kernel.org" <leon@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>,
	"michael.chan@broadcom.com" <michael.chan@broadcom.com>,
	"mkarsten@uwaterloo.ca" <mkarsten@uwaterloo.ca>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	"sdf@fomichev.me" <sdf@fomichev.me>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"sridhar.samudrala@intel.com" <sridhar.samudrala@intel.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	"willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Gal Pressman <gal@nvidia.com>, Nimrod Oren <noren@nvidia.com>,
	Dror Tennenbaum <drort@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [net-next v6 0/9] Add support for per-NAPI config via netlink
Message-ID: <Z2MBqrc2FM2rizqP@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Alex Lazar <alazar@nvidia.com>,
	"aleksander.lobakin@intel.com" <aleksander.lobakin@intel.com>,
	"almasrymina@google.com" <almasrymina@google.com>,
	"amritha.nambiar@intel.com" <amritha.nambiar@intel.com>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"corbet@lwn.net" <corbet@lwn.net>, Dan Jurgens <danielj@nvidia.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"donald.hunter@gmail.com" <donald.hunter@gmail.com>,
	"dsahern@kernel.org" <dsahern@kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"johannes.berg@intel.com" <johannes.berg@intel.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"leitao@debian.org" <leitao@debian.org>,
	"leon@kernel.org" <leon@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>,
	"michael.chan@broadcom.com" <michael.chan@broadcom.com>,
	"mkarsten@uwaterloo.ca" <mkarsten@uwaterloo.ca>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	"sdf@fomichev.me" <sdf@fomichev.me>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"sridhar.samudrala@intel.com" <sridhar.samudrala@intel.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	"willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Gal Pressman <gal@nvidia.com>, Nimrod Oren <noren@nvidia.com>,
	Dror Tennenbaum <drort@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>
References: <DM8PR12MB5447837576EA58F490D6D4BFAD052@DM8PR12MB5447.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR12MB5447837576EA58F490D6D4BFAD052@DM8PR12MB5447.namprd12.prod.outlook.com>

On Wed, Dec 18, 2024 at 11:22:33AM +0000, Alex Lazar wrote:
> Hi Joe and all,
> 
> I am part of the NVIDIA Eth drivers team, and we are experiencing a problem,
> sibesced to this change: commit 86e25f40aa1e ("net: napi: Add napi_config")
> 
> The issue occurs when sending packets from one machine to another.
> On the receiver side, we have XSK (XDPsock) that receives the packet and sends it
> back to the sender.
> At some point, one packet (packet A) gets "stuck," and if we send a new packet
> (packet B), it "pushes" the previous one. Packet A is then processed by the NAPI
> poll, and packet B gets stuck, and so on.
> 
> Your change involves moving napi_hash_del() and napi_hash_add() from
> netif_napi_del() and netif_napi_add_weight() to napi_enable() and napi_disable().
> If I move them back to netif_napi_del() and netif_napi_add_weight(),
> the issue is resolved (I moved the entire if/else block, not just the napi_hash_del/add).
> 
> This issue occurs with both the new and old APIs (netif_napi_add/_config).
> Moving the napi_hash_add() and napi_hash_del() functions resolves it for both.
> I am debugging this, no breakthrough so far.
> 
> I would appreciate if you could look into this.
> We can provide more details per request.

I appreciate your report, but there is not a lot in your message to
help debug the issue.

Can you please:

1.) Verify that the kernel tree you are testing on has commit
cecc1555a8c2 ("net: Make napi_hash_lock irq safe") included ? If it
does not, can you pull in that commit and re-run your test and
report back if that fixes your problem?

2.) If (1) does not fix your problem, can you please reply with at
least the following information:
  - Specify what device this is happening on (in case I have access
    to one)
  - Which driver is affected
  - Which upstream kernel SHA you are building your test kernel from
  - The reproducer program(s) with clear instructions on how exactly
    to run it/them in order to reproduce the issue

Thanks,
Joe

