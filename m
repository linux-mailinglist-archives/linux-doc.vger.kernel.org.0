Return-Path: <linux-doc+bounces-93482-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a73iD0bSPGpTswgAu9opvQ
	(envelope-from <linux-doc+bounces-93482-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 09:01:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB56C32FB
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 09:01:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=e48O1c61;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93482-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93482-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25C133045DCE
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 07:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7B03749FD;
	Thu, 25 Jun 2026 07:00:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382591CAA78
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 07:00:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370843; cv=pass; b=VXeFvKUHnEDpbPGU8CZK6QNEfophTIxw37dBra0OaYjFue5lRFdj6bpJTSGW1154/0TG90iyViBGcqh8mJxu0UqwgGfMJ9ECd7RB0P2odJBRO/G45YyOq6K/wJs1d6utvoMpv+ui7e0u1jkErqX6+jm1ZINW+6ajjc63xIQ5z8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370843; c=relaxed/simple;
	bh=7JJoQZtiGk7coUfKOMj2B/mrqYm3H457ckdZcSJc6Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHqomrMuYgRz00ka6RhAqPZ3/SUog3mWe7OPpxsmVu6rZo/9eCO/f9ZyuiV8T6PPIjhBGNgACcH8A5DHco2hYl78iqVovXH7sjYKFhKR8G+hBkw7Pqrab8ujkee89qWh5aS+GKRHmh1gRlenxJIaqho9+y/LdbdBkJWvb4FOuYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e48O1c61; arc=pass smtp.client-ip=209.85.160.180
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-519ed52bcc6so181171cf.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782370841; cv=none;
        d=google.com; s=arc-20260327;
        b=l74Y1jr0UDscCqebYxdgpWwxX1rFx90Zjao8oaPKHbjancHijK/tKJ+R0uUh65eUFj
         WLDKtv2EDL1xsezC317h6e32+B+Ql1eth4iUCLiDM2oCQxkwstpG3iKUhuVVdAMOWWv7
         strD2Ul2SBbVZrDhPuAgceof8isuCvz6EkZqds2On1aAuo6x9rtihpoB83Z8toiwZ3gi
         mklvkRGO5/bwbfYEUXbC5g9/fBHV7aD0I6bqg7L2WOddzorA+gSRNr90ruF5t+DTwSt9
         8hMfGCymWK0o2zXPR/lU8I9TTeunFL5J5IUnWB/JZV4CnOJaPjIPTXA7S6oyYuNBctd0
         C7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7itwZj77OJzx0Nbk553L+ihvDTrBn0KieHsapLPAjLw=;
        fh=uXYoiVz9BUSPB47blWK46QCH4XP1/8dCKlYHE0h+3ns=;
        b=Jm3F7cnnpGlDy3PjZ2cQnPL+kAYOULRjj5Y7rngagMJ26NB9/1bfCzEG1kp/GNdbKw
         IKFbaI7cpsC/sSLSRO0wnXWo6mmHfWeZxi435r3t4L69K+INO6yvmDhvvuNWpNa7VZ4d
         wRtvYbocq8M1FZWoCxrHRCcuREd/fULc/ts8TmLXRK1oS3RV60dzHm1UTSuk4OS1Up8h
         KgVI1op3WIr+BwpT2wdqUGBR7cvbPHlF+ys4ZvhTb9hEs94+czmGzx72SEq+nrzqSvbm
         8X9I3cGTUvkCcjwZtXr1r46t0YD22KsYptTdoR7+FYuBWi3F2Y+a+wyBfjRl+GITEk40
         TcIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782370841; x=1782975641; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7itwZj77OJzx0Nbk553L+ihvDTrBn0KieHsapLPAjLw=;
        b=e48O1c61mYFrJJ81UCyvgdSdCRMUrJWKUOd8+jsx9qjU68Zcoh1u+PQte4S45rUz81
         eHZ+XntRnpu4a7oXwrvix0ys07R6n29mCO7WpJ4pMesJZZmqTBYJl+mw9RP/9h9H/3t7
         nlt/rRYvNDdcxkMakXg5R/+fUu4LyB+2NsyWK/Ub2RPN9gHe6OWORyk8QxfYetkxXojt
         Mal9Rdm7KC5htW7jw1+QzZmtpFp9ZwNVJeqDtsTwZCigGmcA5X+V77yaB84hQCixhRlm
         SLw9tUwCXaIMpCJ1P69ROgK79CI6kSRUa+j/rsyWSdnxfVp8o2ecDTbc3X8XsT/ai109
         6eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782370841; x=1782975641;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7itwZj77OJzx0Nbk553L+ihvDTrBn0KieHsapLPAjLw=;
        b=JBpelPzsEO3LeBvT9Y8xhDzHswo/ruti6dMXAyjnwLJyrnGBw7n3RIxv951ehMZQjf
         vEnukAYoEqpYu2In+8leKct4sYRRiOM5MI/u/7njZNLIe1QdHFQecpc3Nhnwhf1q/xT/
         PpLEWbrjWXH3MLfhV1wwhZxsdgs5krOdrYqRW9d//v67/kJWs+NtGJYqbbuOwLLzMrcq
         vb8G5RiEt7xCPpHTYajoSsR3wqeTBU/DBxg/slPPGUmq3FFJ+lcDjt/4HEpgrbaTrOAf
         /06+7COJMkSVheAJ7KWK9g14wxn2bmMF4vkGTuO35CLqMUtegT0jy9UwLo3ImgggOuEf
         uY2w==
X-Forwarded-Encrypted: i=1; AFNElJ+fAonJZ+71H3oOdjGIo9IsrlMztybX6BzsyzSQr+/w/mrTEQHg7HKjU1qcy1emqR5JqwKEAj1wY/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGk2GMIBsobSH3eA/v2Z+L9UUJSqo8pxNlymgopYReFI72w7q6
	BEY3C9K5n2yeAPvk2EsTKGUjuA7AC5TB+ToRcML9TADk5wfgZvpcWAoePthyqfPC0nBvZLeRPRQ
	Sn3b3Yze0HAqB3psxXPkA30pR9fW5E/+SEMtnMw7U
X-Gm-Gg: AfdE7ck83AWeGzrPmF8P7FKQBZYq3lH7YjtQmhBTfw8ULAZiOcQi8jmFwQhEhW3ZGbj
	vuEii/Hmu2ZKtIpciAbM/Egc3TfuzuHPpSCGnflvmPUIZnctBXY+VkrIrPaGA6F043cazRaqZD9
	/RDVBrizU+4VxFzJjVQSWx/CCQ+P2fPrnG+OK8GdnkZy2vHVnjdx+hzzWTveeynBSTSV9rdamtg
	nR8tAOV8thl0+mv+6HS+S4iFRe7AVvV3LnuKe/L6r67rogETrTq8m+qmvD4FNR+XGIrhfGJxqxr
	PS+zjZtY
X-Received: by 2002:a05:622a:53c4:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-51a6e9b5655mr7053121cf.2.1782370840588; Thu, 25 Jun 2026
 00:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-34-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-34-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:00:03 +0100
X-Gm-Features: AVVi8Ce3XGRWH9AR3rw80vlHynjgwNotwUVdlcJvIAaDUMJb2MBvPhhdMigDY2U
Message-ID: <CA+EHjTzR9r97Brau5KMmUf7UZvevmhpCKhTEt-9wT=0YXFLpFA@mail.gmail.com>
Subject: Re: [PATCH v8 34/46] KVM: selftests: Test conversion before allocation
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93482-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,google.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@h
 uaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tabba@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tabba@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95BB56C32FB

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Add two test cases to the guest_memfd conversions selftest to cover
> the scenario where a conversion is requested before any memory has been
> allocated in the guest_memfd region.
>
> The KVM_SET_MEMORY_ATTRIBUTES2 ioctl can be called on a memory region at
> any time. If the guest had not yet faulted in any pages for that region,
> the kernel must record the conversion request and apply the requested state
> when the pages are eventually allocated.
>
> The new tests cover both conversion directions.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../selftests/kvm/x86/guest_memfd_conversions_test.c       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 8e17d5c08aeb8..b43ac196330f1 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -265,6 +265,20 @@ GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4)
>  #undef combine
>  }
>
> +/*
> + * Test that even if there are no folios yet, conversion requests are recorded
> + * in guest_memfd.
> + */
> +GMEM_CONVERSION_TEST_INIT_SHARED(before_allocation_shared)
> +{
> +       test_convert_to_private(t, 0, 0, 'A');
> +}
> +
> +GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
> +{
> +       test_convert_to_shared(t, 0, 0, 'A', 'B');
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

