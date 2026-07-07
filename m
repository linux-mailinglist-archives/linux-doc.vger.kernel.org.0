Return-Path: <linux-doc+bounces-95340-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tmjLLovPTGp2qAEAu9opvQ
	(envelope-from <linux-doc+bounces-95340-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:06:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E35071A1C5
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 12:06:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95340-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95340-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBA1B306BBC4
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 10:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB28A3DA5D9;
	Tue,  7 Jul 2026 10:01:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5A3D952F
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 10:01:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418516; cv=none; b=nSXkfG78jH4KLlgnWuc6fHpvZwHk8Y81o0aEJw31pVlDncqc2xhsXqymHmduTloUrLGMQQzYdUt6iK6X3QjSvR6CeYBg5MBQG8Uc1g3Bbyxei+9xGGdkIDsKn2yj2GfR/+OO6uFMOkEzZ/q8Uxe14CVHpYHJtYROa/h+xxCZxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418516; c=relaxed/simple;
	bh=7r4FNXz3y2SeMtN857p6fIJ0YRE5//VC9c/D4GkSxkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXa0L6VmE6YqU2AqTDoXUpRL7U5fiYyeSxff16F8fxmjFl9OLKJUo6S5YpaVqUonvxHo7JzTJZP8dzBWK6UDf0XJD18gzbQB2Hoj0xuCPzIP24Vf8NUZvFnqlutlG0f206pS/6C0pZJw/Ehh7AfLLkk3wKEucaQrfyD+4YYFhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7370ea43b9cso208735137.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 03:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418514; x=1784023314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/8oL4ZxZEt7wgfC7AXxJt5fFWTGlq2rIUB5JaRFMzY=;
        b=F3AOK9UOqdbRRSkNuCWu4e1sa+Ip8Criq8m/0cakXOSrYBYa36zGvd4sfDBaPyGWGN
         YcsvABm0JbUhxIxYNjafEyg6w4CMioRN+cE6nrDqjgyRzT7OrXCYn7zBl6EnWJbeAYS8
         +auttuJPneb+BFSbFF+ifzYnwjAdfq6+StRAry+LjRHG5B9cq8t8FV3P2rin66VxeiKB
         j5fBc2IvFmdgonZLVf3mABLHOUTImmmLONdw3FhI5etMaGjifB8vUiBJukwsX1vizAcF
         WyS1oglt8JX6eaUWzygPeuLsdElF7Vet4xt0t/yRCSjlD3Yg+CNlPk9XTzTaMxHM6MUB
         +ySA==
X-Forwarded-Encrypted: i=1; AHgh+RqqRXZy24y8FvHDV9BPmk4688BEw0+j+5eNJIkQ8yb8zPcKy9hGv15INEevHmCqxNcn7PqIk5/j1R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuaLiP65Z8oUWTpPgJPjSWVDAtjbB83k0l5PcPZd7n4Bj+5m84
	ekXRkidOVffrsL37TGYWB6L8n6szkFzCxyOScuHl7Gewg3MatHJlTyc05+WEIwbQ
X-Gm-Gg: AfdE7clLgDvk/X68dDiVqXog2qPKIjwWcXm1TPONEb7dTLJf+EVDu9p8DLHiKim7Vuu
	kPHBNc8Pcc4V20rbeg35LOrPERZBNfmR+W2xGv4y5rDtP2UOwaZfXFRzIgE4pHG1Cx7eUs28lKS
	Q4HlMCGv2c242SFelWHMzALj7gxMmxCCyMQ9M4nKhY2x+Vs1vfDQ28ej98v6udBDfLu5Z053qbJ
	Xlr/TDjxrBSeOJMEAAR1BYfeOWr+jA1jeNvoPd+rKxPW2bPGN/zUbul6eR5Z99YObABNu0ptdnV
	SaOveVyvMmU7bO9WgbVqeUq9Cz9O3BBrS9UANa6tkAbMZE+/xe5PbcCa4TMPRAMcHxRK8/DBWMB
	Hi5ePbHwZ1Jbv3vRBtaBWKhgujvbrT36vU/xmTg+OfHGV0TPL1bsaCj3pwe8Yj1Lg6Eg2d4EFZb
	9LXxeBMpSv7eeV0FfIE/rVPV8x9jZZJQYq5b+Y6Nr3pEmgVayVUclFQw==
X-Received: by 2002:a05:6102:94c:b0:738:89ca:65a0 with SMTP id ada2fe7eead31-744c229d93emr1067695137.9.1783418514275;
        Tue, 07 Jul 2026 03:01:54 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1c9f8e71sm6619350137.10.2026.07.07.03.01.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:01:53 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bdc4fc26bfso296198e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 03:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr2+qpoPNysAgvYyWo2mksMNlt/soSlem9qqTF3o1WCF49EhinHGrQ5owa7O6+o9oaf86tOzVdZ6KI=@vger.kernel.org
X-Received: by 2002:a05:6122:a1b:b0:5bd:b19a:f7f8 with SMTP id
 71dfb90a1353d-5bf5d253f06mr1049634e0c.2.1783418512547; Tue, 07 Jul 2026
 03:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
 <20260702161330.GH3534761@killaraus.ideasonboard.com> <2026070227-payroll-eradicate-8f66@gregkh>
 <16c507cea8f2873766e1de586d9a0d73234a3038.camel@kernel.org>
 <akaWnQ5Pkg_676B-@lucifer> <20260702211740.GA639365@zen.localdomain>
 <3f447113-4407-471f-878f-e6d6edafee71@kernel.org> <akez23ZhLRSGMFQ1@lucifer>
 <20260703163251.GB3734786@killaraus.ideasonboard.com> <e93d28e4-750c-4a4f-8bfd-7a0b404cd05c@kernel.org>
 <akzETpsps4TMfqpC@lucifer> <0ba6bf66-e48f-40df-a953-503d317b3dbe@kernel.org>
In-Reply-To: <0ba6bf66-e48f-40df-a953-503d317b3dbe@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 12:01:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPe=Lv+_KcUV8S6aNrwBFxP2AaU7Oq9J6PMjhuXDn-ZQ@mail.gmail.com>
X-Gm-Features: AVVi8CePvv2v_fHi093eoEEy2a9Qf_HkTTE0sUWj6yZ-0WNa75KMlBmez4XW1WE
Message-ID: <CAMuHMdUPe=Lv+_KcUV8S6aNrwBFxP2AaU7Oq9J6PMjhuXDn-ZQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Boris Burkov <boris@bur.io>, Jeff Layton <jlayton@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)" <brauner@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95340-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:ljs@kernel.org,m:laurent.pinchart@ideasonboard.com,m:boris@bur.io,m:jlayton@kernel.org,m:gregkh@linuxfoundation.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:justinstitt@google.com,m:cem@kernel.org,m:kuba@kernel.org,m:jkoolstra@xs4all.nl,m:krzk@kernel.org,m:bfoster@redhat.com,m:hch@infradead.org,m:ddiss@suse.de,m:broonie@kernel.org,m:jani.nikula@intel.com,m:axboe@kernel.dk,m:vbabka@kernel.org,m:brauner@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bur.io,linuxfoundation.org,linux-foundation.org,lwn.net,google.com,xs4all.nl,redhat.com,infradead.org,suse.de,intel.com,kernel.dk,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E35071A1C5

Hi David,

Thanks for your patch!

On Tue, 7 Jul 2026 at 11:53, David Hildenbrand (Arm) <david@kernel.org> wrote:
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -40,20 +40,37 @@ Attribution
>  ===========
>
>  When AI tools contribute to kernel development, proper attribution
> -helps track the evolving role of AI in the development process.
> -Contributions should include an Assisted-by tag in the following format::
> +helps track the evolving role of AI in the development process. Further,
> +for reviewers and maintainers it is also crucially important to know how
> +AI tools were used.
>
> -  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
> +Contributions that used AI to generate significant portions of code,
> +comments, or patch descriptions must include an Assisted-by tag in the
> +following format::
>
> -Where (preferred):
> +  Assisted-by: LLM # brief description of usage
> +
> +Or alternatively::
> +
> +  Assisted-by: AGENT_NAME:MODEL_VERSION # brief description of usage
> +
> +Where::
>
>  * ``AGENT_NAME`` is the name of the AI tool or framework
>  * ``MODEL_VERSION`` is the specific model version used
> -* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
> -  (e.g., coccinelle, sparse, smatch, clang-tidy)
> +
> +If other tools were used, they should be specified through a dedicated
> +Assisted-by tag in the following format::
> +
> +  Assisted-by: [TOOL1] [TOOL2]
> +
> +Where ``[TOOL1] [TOOL2]`` are specialized analysis tools used
> +(e.g., coccinelle, sparse, smatch, clang-tidy)

Unlike LLMs above, all of these are deterministic...

>
>  Basic development tools (git, gcc, make, editors) should not be listed.

... just like these.
So why treat them different?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

