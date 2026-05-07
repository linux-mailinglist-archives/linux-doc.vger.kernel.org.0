Return-Path: <linux-doc+bounces-86218-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAZJD2Wy/GnlSgAAu9opvQ
	(envelope-from <linux-doc+bounces-86218-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 17:40:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A80674EB3A7
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 17:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B13DB3033A8B
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 15:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7CF3F0AB9;
	Thu,  7 May 2026 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M9BewFxm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB5234973
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168270; cv=none; b=geDoavpYbnyZBRqVE6ks2O5w4MGXpzLiWHNhUHtJTXSA/7sowBWgZEzXSKo0UErnu74ccRP9LDvS6ERBYKpkmvhUFo/WT0YLBLSa0RAmFyboRsGoIjAeC8OMIRTnabCudUJyB28rLevPhb2sy2d9BlHD7B+zwQxqYxRnMCYPBgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168270; c=relaxed/simple;
	bh=4z1LA7620U3bIFCQ0fVra8G03PXRuuNdedi4Umdt+x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uES1h4HZXjGhJnoifGmKj9IkMfBdv/le6yo2JPzWKKJoD26Sxr0lYtPwXdvQo71h996IZe70lJtJ770pMvsaB+STtHlyh9ImGcsgKIbFdYrwc9CgRZ9yCYX2lMkGznF1I/QOhQgUxcpg7VNmN2kaDdbs14+/hHSYmNmUt4rMe64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M9BewFxm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so163664066b.2
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778168267; x=1778773067; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3SFbYQj7gvmgabkGYv4xpzYjp9xPOKffoC2RtE/vgGY=;
        b=M9BewFxmRBW7Tl4iuz96itayEv02vhhuPV9PNj4kC5yd/5S3PGgQva8qlD4DTmuC4J
         SqMVrhtWN72jgzj/Lfkqs6x9UCtCt0efsaGKR+PK2NFBej8E+ocnirQA+R3AB6v0Okn1
         9jPxchuU56/XqwzK9Qza9jGRiBnyrLzUnkFv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168267; x=1778773067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SFbYQj7gvmgabkGYv4xpzYjp9xPOKffoC2RtE/vgGY=;
        b=EOYYOHn33qsVeJ18amNlPmjw6hZF8aa4F9aTaqoTZxJMXaB03Jc782V8wLtyWhs0Cd
         Q0sqRGEC1n95DQC+oVzynZdDFn/55ZcHmp3E+OKcJH9+gN/PcS3QM1USe7pqd4hQ+Ued
         jhHH3YzVwugbWKHONV/nW8LHL7JD/SDO35RklaN3NvQHzxbH993Aaj/T3jvIgORbWfXe
         2PhS6dReKk2C1B/GzTye3ShTojrJbT1f81SuYJCfuSLjUCU9y1OU0BOzeG+VEUIIROjO
         WLZvv1kGUgkPRNxyaPuPaCk8iNJ/uRob1r5Rwq3AzjwrM5Ymdy0tQb6rwHVB6USoRXmt
         qxXg==
X-Forwarded-Encrypted: i=1; AFNElJ9yhllDdxyeeu+54LNXyd+D6J6uO7eOpk23JLtvqansE4GRMnZGeld9mKrESuvnJDGzD+zdeaCGXmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcku/vIjj1kPm5k2J0CRBVI2ZTjcpiBN3V5ZN8yXPLv9tJDrXn
	OKS0c56TD8Z/XrPdZ5b0JrzDoQgfUQDtHfgJ9fFv+UEK6JEeIqRBOTMZr1jk7XFAl/FxMDjx0UK
	IAxT/U5g=
X-Gm-Gg: AeBDieuDnc7gexH4wpJXWSjH8LlRbvDGjWxNPzBXAuh74yWVt6iFCALx/u6To7jpdtE
	YysEb5I3hSBXZlN3Vc6fexjiuFXj+oHydHB8gPsL23VDkkJhPxiFnGdc0yUmyBUffNuIn+pKrnP
	+LOQ/4y7mFye72p5Xx8TK+A00zgRkbOrZ/0FO8RnY7IZn+peemzWh9ErMSvVJmfEUDOz+uPkHjc
	s2kBGQUh36h8035n64hagbTkEeQ4a3kUFSj8q+zarzs25erUut9NVfKkrsa5HLca76JnBY/De7G
	E2tt5X981gOSnejOjMtWfm1Z4XfewOHolJZbYLUfFJ5aMPi0aiDA1gqLifvcvmPPp/UxZiGgJFI
	NTXkdOALN5mHb7wSaVU+b3E4honSsqrWOEV9oH2jyAvhATq2fiOqBJug2J3gCx6Kn7fxmXkb7BL
	aNBIT3dY0Bbfm8xEfJPX9Ub5od2rWgPEu6AOrzO6CHNQfuavfcdlftsAIxbM2eTh7iYgpq5MuTz
	x1e+B3P9g==
X-Received: by 2002:a17:907:a704:b0:bc6:36c:96b6 with SMTP id a640c23a62f3a-bc6036ca011mr476970066b.30.1778168267090;
        Thu, 07 May 2026 08:37:47 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca546d12e9sm1793866b.20.2026.05.07.08.37.46
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:37:46 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bca0ff2f8dfso57295066b.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 08:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UHggn8owsGjsrCfqb+OOzJwAqiiLJnply2XzMaVApUgv7ZLiapcsyVEeZbQ6aI12FEr1LMdSUVVE=@vger.kernel.org
X-Received: by 2002:a17:907:3e8c:b0:bc2:b202:eaf3 with SMTP id
 a640c23a62f3a-bc56a6493c1mr490879266b.4.1778168265932; Thu, 07 May 2026
 08:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503113506.5710-1-w@1wt.eu> <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <aftmB435XJ8FP3V_@1wt.eu> <20260507070720.GG3126523@noisy.programming.kicks-ass.net>
In-Reply-To: <20260507070720.GG3126523@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 7 May 2026 08:37:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whE=rLLbBRsFuQKVX49NgN2UUdUE=Druf3fiSZ9Ou8c3Q@mail.gmail.com>
X-Gm-Features: AVHnY4It7F_ZiVU3gWouldUT6m56NTwQHgBU0JJIDr0fU-oIC_OgJy_afcjmuto
Message-ID: <CAHk-=whE=rLLbBRsFuQKVX49NgN2UUdUE=Druf3fiSZ9Ou8c3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Peter Zijlstra <peterz@infradead.org>
Cc: Willy Tarreau <w@1wt.eu>, greg@kroah.com, leon@kernel.org, security@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A80674EB3A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86218-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linuxfoundation.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,infradead.org:email]
X-Rspamd-Action: no action

On Thu, 7 May 2026 at 00:07, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Perhaps also note that including a reproducer for a crash in public is
> fine, including a full blown exploit is not.
>
> So perhaps that can serve as a guide

That would be a good rule, I think - and I like how it has the
advantage of being very explicit and black-and-white, rather than some
"I think my bug is so important that it should be sent to the speshul
super-sikret list".

Because we all think we are special. Our mothers told us so, and even
the AI bots are typically explicitly told to act as experts. So they
think they are special too.

              Linus

