Return-Path: <linux-doc+bounces-93496-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zdNDF0nwPGrGuggAu9opvQ
	(envelope-from <linux-doc+bounces-93496-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 11:09:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1086C416D
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 11:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=INyDshRk;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93496-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-93496-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF00A3007ADA
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 09:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077D81EBFE0;
	Thu, 25 Jun 2026 09:09:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81EB3749F0
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 09:09:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378558; cv=pass; b=RCtCUDXje9jLZ8fBMzOUEnQgWS8qOund9EcxoTEO5Ys1tN79Ci9dBZRS/E1Toenn8IhguzFgtWEJY/ns1Q718mn0fWLfKNLR8SzxVUl9s4h5hZNH7ePBwjpw9JUty406K/igLIq/x+CHgwG01odsHZZeDVBZqfMCLGfh2ENRzEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378558; c=relaxed/simple;
	bh=9leBl/vLIM3qHmEH/Edw801DRnY2C/1n405lmvRfXQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXg20S7Uu8urx1EK4VZb0pYTCdJOx5LrIvpJkKlffEfcXBs2gSmz04/p43Rl60t7vkBRVuyV4+HCoAX824efbOABnAH7b/Ljf0Yn7pnZcLGWsC7zcKRV/EA1Z8HyisdeBJ6Yl6qd78AkZrlv7OnARZqOwIInowPO6VvWAQRu2Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=INyDshRk; arc=pass smtp.client-ip=209.85.160.178
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51765331535so160131cf.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 02:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378557; cv=none;
        d=google.com; s=arc-20260327;
        b=dmkanzISM6zpNTz17W2zT6sgWt7gM5QAS1sRlKdv4/5UPkWDTyu6dIx2b/8gIC8EW0
         zL4CIvOGARqQ3tuU8hA8hcTbOELI08M4z7814LqvSleTiTinqYWU18fGo2pLMbd5oQkh
         iRb2jxb0S/eKDJIR7LGbiqUTGH+GCVYOUBpwCOFdhgQLGcYcL08ov1zdJLR9VpZdyyVC
         IIHYPO10CeKSQZbnB/ENNeZPey8y9bwETQKagh7PkL24Ukcqh85XuVYf5G3smvEUdhSD
         7wc5qN2lzhA7VjRoiR2nU7O4kZQvwVt1Xf/rs3fXv2LjOrTyfomCWhr9spiI8X/bBPCh
         4XWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        fh=JRE52GqVdPL4nHVzvCDduh7kCHmYXMJPfCgFY52kUy4=;
        b=cWHyK4phhN199Cb0JFoyUsFnLas/DykvkH5hNJESu2WDIV4szMbYMdXTQCu7mzMEY4
         93YU1aDALSzrrztcwIg9zTs3MS2dW51wl4Qy9nU3YRZJ/tCENXCAcpBatGqwrEJ5fMT2
         5A3ewQ25818A6yPId/pRg0JuV1JZTKmF8FhvprrwwCulRl3/VZNNIz1/pQlsz/K44Bzo
         O6A/JapcLSbFOS3Uqv9RvgcBO3PLFhYt9eBGUf++ln+2IEmFEg4ss8Pb5M3yxFVbAHF8
         YfM7nAf7zk3rd3ouOpEhFawqESX1FdMq3qMYFS+adgqOZGo2fFO/3eQSJAh1BqwNiryA
         bLfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782378557; x=1782983357; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        b=INyDshRkn7rbxFE6G/CTCG7WLHWCEG1YpxmbfOF/wunu6PwW13F+i8LzNvZhqZlG0a
         l8YpJpG/mBRfUp6rieni6+rccFHhNacQvv6Mv9gx6JlyIuR9oJJgWsQ+eptkgbGPCAJI
         N24EmHpOIrYd8g+ctfnkYX6QSHzcLuzoIbXnYgqZRrH4O5zrzgW4Znih9Mo0WiVCdh+K
         yfKjpPgT9TOlaZiz4tgXBB3dMWrK1bmJHiXwA4hGeYsQQvnzbqa3vzhkMWxr6yBji7DP
         QbbkbjJZ+VQkJtqV/3obEUh8rtECqWFAoREMyPfM+4MmVual6dG6ZrTaZheiuON1e5ov
         OQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378557; x=1782983357;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9slP6pRfRJTNIoqGcM2r5fRlSRzSJ4pkgblOXA4Ai4=;
        b=svlgMDqkD+r4Flpj6AOahYeV4FZ3nP0YiC4v84joVfDTQPUrAWBTZZqd7c3DYX1qhu
         xIKDfH1g3bPmID+rHWK7hmTPqQLEeWN9aGa1rvgoDVBiwb1HZUz1BsvYsRHp4ycx6g9d
         LP/z4nGlfr9dLp2InE2d2YdT/aDps3XGdkih+Lwu4KXcNt7BmFJyTnQEWQPyRsb+F8Ef
         dh3QDq+po63GQUhnC2oSJwC6mLq3y1yEnwJFs7kqUyGIxIjBfqaADdK1Lh/WuIVOhqrh
         5CnIsxdZ0cUAE3mA9RgiR41MqWmYcqhHN/ytSN3ct1r4bI8MJf7MfbFBEYbqTBruPMA4
         Ks3A==
X-Forwarded-Encrypted: i=1; AFNElJ/rYU+4nwazjVPL5tXvy8jlU7W+iv9mHIZe1AThkSRHw55TiAjXaePJuZNg0CqUFG/eFWy3I6J9zf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnZhubQIhlp+6ow38ft4ISa0ljvKfRn9OrlO3gpgVLyarpsu1s
	3JtCizZ/z/AnghC8ObuC5WuLG5dg2GCwOSYzaD6zztXsCooD9RiAbyNnFGP+B1Gs9wXhF5GZ4IU
	k+DKaHP1Eg2H25RBVd93PlRazFiaSi0dRilt53J/M
X-Gm-Gg: AfdE7ckJp3fWpM6IAZhu2ED0HouCtFA+0V5q46L43kr8xxkADIdgNcqveB//mvp0doq
	+QLIY3NaHpd/23mtQTYk/LV4rEwlu33JuJ5MDaEA+tHYql9O07d3f53x+6woGvl6Ugiobr95lIg
	/5OFpykgAvhYII8TKz+iVCPSOjl1oUpIJaa7cHRzXM1UbYdabvsngAUEW4mwHJmfiU2HOgCtOoL
	fzR0HSIAXD4/1Z998nsD33PkMVLc3ZUCw2Qcns2Xxp8JT6o3y+a0o5nZ5H7DcE7vnCy578qfw==
X-Received: by 2002:a05:622a:681b:10b0:51a:713c:7444 with SMTP id
 d75a77b69052e-51a713c7d5emr4672591cf.18.1782378551258; Thu, 25 Jun 2026
 02:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-42-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-42-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:09:00 +0100
X-Gm-Features: AVVi8CetvJC1Xv6WjNcu210fkMycJkdRkSQWNh7yK6lGtnxBBkgdQs08aLwNOyo
Message-ID: <CA+EHjTyHQa2Pmgc=0zf6emtALxAN5f8gUXoV11mShz2qdrqjTw@mail.gmail.com>
Subject: Re: [PATCH v8 42/46] KVM: selftests: Provide common function to set
 memory attributes
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tabba@google.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93496-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,google.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@h
 uaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tabba@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A1086C416D

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Introduce vm_mem_set_memory_attributes(), which handles setting of memory
> attributes for a range of guest physical addresses, regardless of whether
> the attributes should be set via guest_memfd or via the memory attributes
> at the VM level.
>
> Refactor existing vm_mem_set_{shared,private} functions to use the new
> function. Opportunistically update the size parameter to use size_t instead
> of u64.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 46 +++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 3a6b1fa7f26ef..db1442da21bb1 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -454,18 +454,6 @@ static inline void vm_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
>         vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
>  }
>
> -static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
> -                                     u64 size)
> -{
> -       vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
> -}
> -
> -static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
> -                                    u64 size)
> -{
> -       vm_set_memory_attributes(vm, gpa, size, 0);
> -}
> -
>  static inline int __gmem_set_memory_attributes(int fd, u64 offset,
>                                                size_t size, u64 attributes,
>                                                u64 *error_offset)
> @@ -532,6 +520,40 @@ static inline void gmem_set_shared(int fd, u64 offset, size_t size)
>         gmem_set_memory_attributes(fd, offset, size, 0);
>  }
>
> +static inline void vm_mem_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
> +                                               size_t size, u64 attrs)
> +{
> +       if (kvm_has_gmem_attributes) {
> +               gpa_t end = gpa + size;
> +               off_t fd_offset;
> +               gpa_t addr;
> +               size_t len;
> +               int fd;
> +
> +               for (addr = gpa; addr < end; addr += len) {
> +                       fd = kvm_gpa_to_guest_memfd(vm, addr, &fd_offset, &len);
> +                       len = min(end - addr, len);
> +
> +                       gmem_set_memory_attributes(fd, fd_offset, len, attrs);
> +               }
> +       } else {
> +               vm_set_memory_attributes(vm, gpa, size, attrs);
> +       }
> +}
> +
> +static inline void vm_mem_set_private(struct kvm_vm *vm, gpa_t gpa,
> +                                     size_t size)
> +{
> +       vm_mem_set_memory_attributes(vm, gpa, size,
> +                                    KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +}
> +
> +static inline void vm_mem_set_shared(struct kvm_vm *vm, gpa_t gpa,
> +                                    size_t size)
> +{
> +       vm_mem_set_memory_attributes(vm, gpa, size, 0);
> +}
> +
>  void vm_guest_mem_fallocate(struct kvm_vm *vm, gpa_t gpa, u64 size,
>                             bool punch_hole);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

