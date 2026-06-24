Return-Path: <linux-doc+bounces-93430-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DIv7Fm1UPGo/mwgAu9opvQ
	(envelope-from <linux-doc+bounces-93430-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:04:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BA6C1ADC
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:04:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="SObUVJ/X";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93430-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93430-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93D203003505
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFEB2EC0A4;
	Wed, 24 Jun 2026 22:03:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4BC2580F3
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 22:03:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338608; cv=none; b=hXXqH8W8xa4/OtE0s6L7bigTAO/RZFvG1lMYB1JXK2o+YHT1294K0zTVkzxbNwmGPnS+r498roTluZGCJcMFdRNaM9wIN8yh0/ghu+1t/lNZCmokoGIS6AnR+Q/g5sXDcclhhYPS4+Q/PeZtEyb0X0D1xiUy9SMagg4ISdKPVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338608; c=relaxed/simple;
	bh=r5g6+V2Amp0yxvechpGrRZ8S0WXq2V+a9zpffLkRRbs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jBab5BFwkjQih2/cSEMCafPTLKu8G/bi3vJSegNgz15gz55N0/W/3rNkk57ROn2r/3f6Wqx8uP76cRO/4T5mwVSGONRueKObQRJVQVTl02COFbU5WX6ueBBNLW7e4BNJswsxVRcV7bSh8RB1VwsxWTmyKcuZ77KwZboQq+sG+2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SObUVJ/X; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c6b4271491so8440235ad.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782338606; x=1782943406; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LrxdfhnpHc3n007Ugb6QRVTz2pRJtP7mIebzaELjk+Q=;
        b=SObUVJ/XwM/8X/u5K+FLmwR0Ro+ahCGa9/NEmzB56ZR8v4Ew6ZZrF7d68urzSWnwUb
         uuT0amuVOUfeyZp6Sup+nlLEnGuJ7Yu3puRuNwxAasidRsB+xLKDEZ34hR+X6qc+ohE7
         5GtcUVq/rS7hpRgEzVD5PNSBgVFB6yYrpmWYo/SjgqC2kb9XPTKr+Ln3D8jxuszitcEe
         02CtOLX5kLA1nKcEFFFfHU6TO/wNgsxFWN+n0GgajK5IiySA3nfe4+fRraHbMTJVz6Nr
         gKmNaHtssc+Iq4/h/Z2Dfy2J2cudsTHZLPqBipPTRqAENFaqxiEe47Tm59OmQO55OvI0
         D6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782338606; x=1782943406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LrxdfhnpHc3n007Ugb6QRVTz2pRJtP7mIebzaELjk+Q=;
        b=VuSo/qUAgx4cxljBUx/+5NxStiuBw9Z0aN3jkvbE7+8I2W5lExwGpXN/tHpoVQuLi1
         Kr9KRMbFyORhYXf6KyacrQcP6nQoHQgv1lfMmkz4YLIWfObQ75E1USCdEtkYE9pLLuS8
         Lh9ejwFET+enB6fnzBOliAk+ItDHxWtbO41w4UlmYobgfW7l/MrCFCYJurmNnzKilRUK
         c8iP8p/VDXTmlk9ZuqUmawsh4t2KaV9Jt6fY1XzHJ9b+F6bY9/Wp/iWSpC34EFbwdc27
         jQ7jbyvC0xnCur5qOHRHZ3yBnaPS1ybvWX0sK9nVH2mrWqs4mR9cm090vj6YbOztKKlY
         ItOg==
X-Forwarded-Encrypted: i=1; AHgh+RphALQueqCZBHTwBJPoPnFnkNq2CLgimciGTq9x3Dwo4oxyH52KgNaQSxVDtewgQiPaBQVV+TNdjS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0VUr/4qOH5CW7MxApvOxN0uoB7hxjSuA8bZmPuMot/zyXHNm5
	LupeiyWvrQMQDWIy8H4oq/vVOq715DL6xWJGcE/KEdS/m2twR6ER+rhtPLtCuUXx0i/r+tVzIBi
	XuK0TFA==
X-Received: from plbl20.prod.google.com ([2002:a17:902:eb14:b0:2c7:e126:e2ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4d0:b0:2c2:21e9:5a7d
 with SMTP id d9443c01a7336-2c7fc8a9b4fmr173895ad.34.1782338606050; Wed, 24
 Jun 2026 15:03:26 -0700 (PDT)
Date: Wed, 24 Jun 2026 22:03:25 +0000
In-Reply-To: <20260624214955.6kkivefeuapcocib@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622-vmscape-bhb-v12-0-76cbda0ae3e5@linux.intel.com>
 <20260622-vmscape-bhb-v12-7-76cbda0ae3e5@linux.intel.com> <ajvUp_kPJBRZ7k_p@google.com>
 <20260624214955.6kkivefeuapcocib@desk>
Message-ID: <ajxULasZkCS57NPq@google.com>
Subject: Re: [PATCH v12 07/12] static_call: Define EXPORT_STATIC_CALL_FOR_MODULES()
From: Sean Christopherson <seanjc@google.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	David Laight <david.laight.linux@gmail.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Asit Mallick <asit.k.mallick@intel.com>, 
	Tao Zhang <tao1.zhang@intel.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93430-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:pawan.kumar.gupta@linux.intel.com,m:x86@kernel.org,m:jon@nutanix.com,m:nik.borisov@suse.com,m:hpa@zytor.com,m:jpoimboe@kernel.org,m:david.kaplan@amd.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:peterz@infradead.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:kpsingh@kernel.org,m:jolsa@kernel.org,m:davem@davemloft.net,m:david.laight.linux@gmail.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:dsahern@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:sdf@fomichev.me,m:haoluo@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:jbaron@akamai.com,m:aliceryhl@google.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:asit.k.mallick@intel.com,m:tao1.zhang@intel.com,m:bpf@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:davidlaightlinux@gmail.com,m:johnfastab
 end@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,nutanix.com,suse.com,zytor.com,amd.com,alien8.de,linux.intel.com,infradead.org,iogearbox.net,davemloft.net,gmail.com,redhat.com,linux.dev,fomichev.me,google.com,lwn.net,akamai.com,goodmis.org,linuxfoundation.org,vger.kernel.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,infradead.org:email,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D37BA6C1ADC

On Wed, Jun 24, 2026, Pawan Gupta wrote:
> On Wed, Jun 24, 2026 at 05:59:19AM -0700, Sean Christopherson wrote:
> > On Tue, Jun 23, 2026, Pawan Gupta wrote:
> > > There is EXPORT_STATIC_CALL_TRAMP() that hides the static key from all
> > > modules. But there is no equivalent of EXPORT_SYMBOL_FOR_MODULES() to
> > > restrict symbol visibility to only certain modules.
> > > 
> > > Add EXPORT_STATIC_CALL_FOR_MODULES(name, mods) that wraps both the key and
> > > the trampoline with EXPORT_SYMBOL_FOR_MODULES(), allowing only a limited
> > > set of modules to see and update the static key.
> > > 
> > > The immediate user is KVM, in the following commit.
> > > 
> > > checkpatch reported below warnings with this change that I believe don't
> > > apply in this case:
> > > 
> > >   include/linux/static_call.h:219: WARNING: Non-declarative macros with multiple statements should be enclosed in a do - while loop
> > >   include/linux/static_call.h:220: WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> > > 
> > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > > ---

...

> > Drat, I forgot about this.  Exporting static call trampolines for KVM came up in
> > another conversation[*].  I had already put together patches to effectively default
> > to exporting only the trampoline, and also to deduplicate this code so that the
> > CONFIG_HAVE_STATIC_CALL_INLINE=y / CONFIG_HAVE_STATIC_CALL=y / CONFIG_HAVE_STATIC_CALL=n
> > implementations don't need to copy+paste the same lines of code.
> > 
> > The attached patches touch a lot more code, and will conflict mightily with KVM
> > changes I want to land in 7.3 (more use of a static_call in KVM).  But if we get
> > them applied (to tip tree) shortly after 7.2-rc1 and provide a topic branch/tag,
> > then there shouldn't be too much juggling needed?
> > 
> > If we want to go with the more aggressive cleanup, I'll formally post the patches.
> > 
> > [*] https://lore.kernel.org/all/ahhoDGUz39KSGZ6o@google.com
> 
> Thanks for the context.
> 
> Earlier making the key ro-after-init came up as an option in a thread with
> Peter. Does it look like a good option to you?

No, it won't work for KVM.  kvm.ko (owner of the keys) updates the keys only when
a vendor module (kvm-intel.ko or kvm-amd.ko) is loaded, and updates keys *every*
time a vendor module is loaded.  So for KVM, the static calls need to be __read_mostly,
not __ro_after_init.

> diff --git a/include/linux/static_call.h b/include/linux/static_call.h
> index b610afd1ed55..ea56da8fb446 100644
> --- a/include/linux/static_call.h
> +++ b/include/linux/static_call.h
> @@ -200,6 +200,14 @@ extern long __static_call_return0(void);
>  	};								\
>  	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
>  
> +#define DEFINE_STATIC_CALL_NULL_RO_AFTER_INIT(name, _func)		\
> +	DECLARE_STATIC_CALL(name, _func);				\
> +	struct static_call_key STATIC_CALL_KEY(name) __ro_after_init = {\
> +		.func = _func,						\
> +		.type = 1,						\
> +	};								\
> +	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
> +
>  #define DEFINE_STATIC_CALL_RET0(name, _func)				\
>  	DECLARE_STATIC_CALL(name, _func);				\
>  	struct static_call_key STATIC_CALL_KEY(name) = {		\

