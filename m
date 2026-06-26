Return-Path: <linux-doc+bounces-93698-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3SCnOhl8PmqJGwkAu9opvQ
	(envelope-from <linux-doc+bounces-93698-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 15:18:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2056CD5BE
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 15:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KOljbKj7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93698-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93698-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB3A9301D301
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B433F44F4;
	Fri, 26 Jun 2026 13:18:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E283F6C39
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 13:18:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479890; cv=none; b=aL+KynuyoioygIY5jgCwKkxxMHsPzEix9nxSoV1UXqFSvgDebPM/og8LfPPyWvfqkTfB+qNq8mqK49yCSrD2EDPbU5ikMOJlmcD5w75H7lY51s6GE+WyR+NoKb/OxX5CMo5cMQpxueYBJ85KqdKY/59lO9lS3bETl76g/zz1qs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479890; c=relaxed/simple;
	bh=2go8tLsemrVF9QHB7Woqcbs5lO6ciMBQ+JmmMaNzJ+E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0hpfvj6NUUDzVMW2ap3HaI+vNaQ4xLxrtR0ruBrK+dURBpTm4Jh7/IiHX/JQJvEHtt9xM6OVUL3uGTqAX44vf1mAQsVsB2EEIo5FSEIewMuliAGkLHwduUa6Npr+lzT1KVo3C1HalYKrKv1GbVb2fTLavdgUYcb/YIJZFuVQHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOljbKj7; arc=none smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c944aacbaso1493644eec.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782479887; x=1783084687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5i+CvOkHBeeX3a+TkIm9MbIlVbCj3+vQ7+Rec0FlPA=;
        b=KOljbKj7nuHeUJuT2+4Kd5fIWO8h0a63z8JWRxpNUPpCUz9bWZNC+bU37oVt9JYjR4
         piqELX5j9BeXj19pF+KFLL6FPILjY7Ez9dmNOUQ0EYQvkOUGtlsfc1gkBrjFMl2wtJC0
         AHdR3vnfkhXeSllDVsE0kNEaapa4KHWduaMilw/1gYg56xrbk/DvjGeJ4hmLhJSQc92z
         qbca0WKDg3MluJ2kUfg4Zcs45YB4rdeXN08ZzoKkGHDLZvN4+ORDl827EvBMWT/atBHi
         cdic7pPC5znVNIFvfbxGab36xA8q1Ipzxvlfbrk1DUuKViSfDw8F/r2/tLy/ciciB7Pb
         ONNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479887; x=1783084687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5i+CvOkHBeeX3a+TkIm9MbIlVbCj3+vQ7+Rec0FlPA=;
        b=LKWEvFJUBJL4wmUIrsr9AWU7VFeHa5tisUIf2oJTs/DUy/s14s3UieRVdSYscS5qCp
         14mphl0NDZt9jxKoc6W9qZyj4QfK5r5uZObDGGu+ScdMDKiL5aVN84Lf9ai2TVyhcmR6
         hwDai4nPdpd4/o4YhR/AL8OtLjsWP9iUrzV2UiVup0TEWNdQJg/kLhTGF9V5hRMqkfHj
         6b3D29L48TS5qKclEZBF1n4n/vXLQlVl+LlOal1HyBOx2Ix3K7St01WejMR1YoOpUWxX
         8bw9idLUtIW99AgnAk+VXoR0vfAxxy4nvh8+VnV3pxSGd1t3EAArMYqWPQmWhhWsSy2u
         9JLA==
X-Forwarded-Encrypted: i=1; AHgh+RqLusEv+wsfbl+YSDpbAnLSVpe6tYN3Gveh05L6LdUGVV4pACgeyqM2vLSfHNJczFJzCHtVNfXpUx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXA8j+Iwzdwx0jqYHCzKzV/Mhqo1u/sq9gaDgJsHHkxC/aIv8u
	j/pjFWNrErcmavJ3zrWwBnBpHYqHKCnpVWGZa3FpYUHi7eflzfosgKnb
X-Gm-Gg: AfdE7cmlVsmsK3xIiP8A8X3g7+XEjJklC+i/jAYxEWgURBd0qz3SBfaq9on/HMazDKa
	7iVJ0IwOXajvkm53Gcm4304h1A5Vt+3r1p2AeUDVWSpp0B73VNL7NHRJZDiXgyzIOpH7XATo4dP
	LoE9TVYgW8rWYtdXewHslpl62utEIIoEJM9PE/TnwhQ94sPoUz5hyehqOdU7pCYIfbzLL62Ymwp
	xn8l1B13veLabz/twl4scRLYhrR01c0cCOradUWZS+Yg2W6huOY/hlJQs09rk0djno3M++v/vV8
	RdJ2leNzozhmY4Y7ixd45WE45Upvi8KG/aePTZFQ/JIJgLGyAw2inFKgY6Oa503LgPAJYzN25Vb
	oOIKP5w0sG36D48oGBwkffxG9S3ouf1rHGJHEs9CK7mKIOprQme8eU5bUGoEzno4baNyF9Sruz2
	T2anJUb/OL
X-Received: by 2002:a05:7301:5f84:b0:307:37a4:15dd with SMTP id 5a478bee46e88-30c85009ea4mr8248003eec.26.1782479886899;
        Fri, 26 Jun 2026 06:18:06 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm17211867eec.27.2026.06.26.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:18:06 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Fri, 26 Jun 2026 09:18:04 -0400
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, yury.norov@gmail.com,
	linux-kernel@vger.kernel.org, mingo@kernel.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
	tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
	seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
	srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
	vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
	pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
Message-ID: <aj58DG3BLf3YWPyg@yury>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
 <20260626094153.GD2568396@noisy.programming.kicks-ass.net>
 <79e85557-719c-4fc8-98ad-7bdcc6add753@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e85557-719c-4fc8-98ad-7bdcc6add753@linux.ibm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93698-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yurynorov@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:peterz@infradead.org,m:yury.norov@gmail.com,m:linux-kernel@vger.kernel.org,m:mingo@kernel.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:kprateek.nayak@amd.com,m:iii@linux.ibm.com,m:corbet@lwn.net,m:tglx@kernel.org,m:gregkh@linuxfoundation.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:vschneid@redhat.com,m:huschle@linux.ibm.com,m:rostedt@goodmis.org,m:dietmar.eggemann@arm.com,m:maddy@linux.ibm.com,m:srikar@linux.ibm.com,m:hdanton@sina.com,m:chleroy@kernel.org,m:vineeth@bitbyteword.org,m:frederic@kernel.org,m:arighi@nvidia.com,m:pauld@redhat.com,m:christian.loehle@arm.com,m:tj@kernel.org,m:tommaso.cucinotta@gmail.com,m:maz@kernel.org,m:rafael@kernel.org,m:rdunlap@infradead.org,m:kernellwp@gmail.com,m:linux-doc@vger.kernel.org,m:yurynorov@gmail.com,m:tommasocucinotta@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yurynorov@gmail.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,vger.kernel.org,kernel.org,redhat.com,linaro.org,amd.com,linux.ibm.com,lwn.net,linuxfoundation.org,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yury:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F2056CD5BE

On Fri, Jun 26, 2026 at 06:39:48PM +0530, Shrikanth Hegde wrote:
> Hi Peter, Yury.
> 
> On 6/26/26 3:11 PM, Peter Zijlstra wrote:
> > On Fri, Jun 26, 2026 at 11:39:01AM +0200, Peter Zijlstra wrote:
> > > On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
> > > 
> > > > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > > > index 80211900f373..5a643d608ea6 100644
> > > > --- a/include/linux/cpumask.h
> > > > +++ b/include/linux/cpumask.h
> > > > @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
> > > >   extern struct cpumask __cpu_present_mask;
> > > >   extern struct cpumask __cpu_active_mask;
> > > >   extern struct cpumask __cpu_dying_mask;
> > > > +
> > > > +#ifdef CONFIG_PREFERRED_CPU
> > > > +extern struct cpumask __cpu_preferred_mask;
> > > > +#else
> > > > +#define __cpu_preferred_mask __cpu_active_mask
> > > > +#endif
> > > 
> > > This is cure, but does it not result in set_cpu_preferred() changing
> > s/cure/cute/
> > > active mask, and it that not somewhat unexpected behaviour?
> > s/it/is/
> > 
> 
> Yes. I thought about this, but i didn't see anything bad happening apart from
> setting it twice. But I do agree, it is an eyesore when CONFIG_PREFERRED_CPU=n.
> 
> > Typing hard, clearly. Also hitting 30C before noon :-(
> > 
> 
> Take care. Even we should have had monsoon by now.
> But its bright sunshine :(
> 
> > 
> 
> For this reason, i had it as a function instead of macro in v4.
> Do you think we can still fallback to it?
> 
> only caveat is it won't be a macro. But since it is still compile
> time optimized due to IS_ENABLED, it should be relatively ok right?
> 
> +void set_cpu_preferred(unsigned int cpu, bool preferred)
> +{
> +	if (!IS_ENABLED(CONFIG_PREFERRED_CPU))
> +		return;
> +
> +	assign_cpu((cpu), &__cpu_preferred_mask, (preferred));
> +}

 #ifdef CONFIG_PREFERRED_CPU
 #define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
 #else
 #define set_cpu_preferred(cpu, preferred) {}
 #endif


