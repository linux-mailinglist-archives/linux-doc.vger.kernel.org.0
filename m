Return-Path: <linux-doc+bounces-42105-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E032A7A5AB
	for <lists+linux-doc@lfdr.de>; Thu,  3 Apr 2025 16:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD0D16664B
	for <lists+linux-doc@lfdr.de>; Thu,  3 Apr 2025 14:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB2C2505B9;
	Thu,  3 Apr 2025 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EYk1fH69"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B92500C5
	for <linux-doc@vger.kernel.org>; Thu,  3 Apr 2025 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691719; cv=none; b=kPd3aNkaSF4WH+/GVVp6N3GO3VZ0RPAvIh1iWCZ6jgsSBDU9gfzztWkFAKylC+4W+jfhbcjPI9YtELNBDn0FAaDWgY9dUJfRwWgKPAUYDiMV5NOeMq+z00jaGkEe6cXn/GpXnT1w7qeZ9wz/Ggz5faYlDx5bBvjfADo8k/iY0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691719; c=relaxed/simple;
	bh=wmF3ASAu4l5e5QaPK3NSuhBM69OYwzUeQtDHQcn6MS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qcvJ5/g7VEO8u1G69JZCg7cK7wEN9Xv3lnya8y+9ZMO6/NNMwIenxXn7IdFlGFA/VrIPbASvuJKLH1JsyU5KkS3+o/ogrRiBTa/KGm63zyACcmAUbwUboiqH1cSw0D392HTI2mf7bHVCU/dipdXxH55xwS5e/nflZtxqDZSxH1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EYk1fH69; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736abba8c5cso1291255b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 03 Apr 2025 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743691717; x=1744296517; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=igg3zobfFtydVGAelA7JZ01NRykTuhkzUPbgteiqM9Q=;
        b=EYk1fH69tc4yf17oohqE/smapvx70QbTJXOdw3Oj/CBkroQgFazxXoiPtcfYcy30Ni
         cbUahoZOzeiqR+osRxk3fws1H+8J2X4eOza+dSB3gyQI2o0boG6bwtB5FVHmY1GXrzxN
         KtoR1P6d9k2mY06HQFV3wSM+cNGxt8sobihMT/QAr+ea/AyncRf1FlzFZtzxJmxQJD9l
         S3uUO++mwmQMgTqpeSXYEt+EAIZFq80Qy7HAQXZeEPnNuThT4xtdMM2Vgyoj2GQ+5/OB
         ZwnPnhie3oJ6/oQwLttkQxhtrnk/uKrSx+NI6bvQGyFsA8TdT1TgGTTgPXePvPqEbK+E
         SX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691717; x=1744296517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igg3zobfFtydVGAelA7JZ01NRykTuhkzUPbgteiqM9Q=;
        b=mEAGQitd0jcy61Y+du11AGI+UA/f6Arf1RgCy1iwHxBZNT7lfl2X/i6Ao8hh4p4tlQ
         yAKS6/onL9vfZszZ08tkGQJhFU9JMdSfHshK9nNKgjk1gessf++vGjhoN/cgU+X3zxVd
         zcT6dxZlRJhxNfAzQCtTIY0GVk2J6oLFdsg2pRzDyl+OSojxHg6DviIX7AWfLLMJoZ0+
         ToFk4U3Fwmbh5qQuqKq1gWCWhbnf0WQpb79Cic4yg9bD43Z3IPccETNBswgJsa6Ou+Qn
         3FePrPju9SfAxFIwbIesQwvTF3VSlN18mRUuWOAb+W4N54qFHRnqX3yL2rHfkQ2mkmHx
         vpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTD9ZdByOSwNe6hxDVK/QUA3her116qFn3SJYitJpbQQheE/zcd47kRuEifxU+95FBWoVahNn330M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQBkqEu1xBa4kmF2nGLZ/1xTPyeJ3LZupga0Y1zBQc1Q9Zlqg
	FwvLot3QozL+8iOcz8usnFqzYkMGbAPHkT1K9hcTMxQk1/sPQWOUCyidYzvatUB5BjCSVBJJkMi
	rcQ==
X-Google-Smtp-Source: AGHT+IG9IJrC2WV7WLtmMSWgTecisx21a4/DmbtG4CGcCIp6FaiyOk56NSQtsUf8hBMYnyjC9Po0xvGrGdU=
X-Received: from pfam26.prod.google.com ([2002:aa7:8a1a:0:b0:734:6f4e:794])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:848:b0:736:5b85:a911
 with SMTP id d2e1a72fcca58-73980399504mr32373172b3a.8.1743691716806; Thu, 03
 Apr 2025 07:48:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 07:48:35 -0700
In-Reply-To: <Z0DOdTRAaK3whZKW@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241122-guestmem-library-v5-0-450e92951a15@quicinc.com>
 <20241122-guestmem-library-v5-2-450e92951a15@quicinc.com> <Z0DOdTRAaK3whZKW@casper.infradead.org>
Message-ID: <Z-6fw8VuDTk4soN8@google.com>
Subject: Re: [PATCH v5 2/2] mm: guestmem: Convert address_space operations to
 guestmem library
From: Sean Christopherson <seanjc@google.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	James Gowans <jgowans@amazon.com>, Mike Day <michael.day@amd.com>, linux-fsdevel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-nfs@vger.kernel.org, 
	devel@lists.orangefs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 22, 2024, Matthew Wilcox wrote:
> On Fri, Nov 22, 2024 at 09:29:39AM -0800, Elliot Berman wrote:
> > A few near-term features are coming to guest_memfd which make sense to
> > create a built-in library.
> 
> You haven't created a library, you've created a middle-layer.  This
> file primarily consists of functions which redispatch to a function
> pointer.  I think you'd be better off creating a library!  That is,
> have the consumers register their own address_space_operations and
> have functions in this library which provide useful implementations.

Or, go even further and move the overwhelming majority of guest_memfd code into
mm/.  But I suspect that will be practically infeasible, in which case I think I
agree with Matthew.

Either way, the Gunyah usage of the library/middle-layer needs to be included in
the series.  It's impossible to review the code split and APIs without seeing
both KVM's usage and Gunyah's usage.  E.g. this series allows
__guestmem_invalidate_begin() to fail, without any explanation as to while that's
legal or desirable.

