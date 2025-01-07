Return-Path: <linux-doc+bounces-34250-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44816A04BA1
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 22:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DBC93A5CD6
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jan 2025 21:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742341DF98E;
	Tue,  7 Jan 2025 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z6Sh/5ce"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02A61E1C22
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285355; cv=none; b=CBY1oq9A9909nELCTiLriKg1UGDNZPLDJQeNe4tVJfONo3jQkK3K+K6KOjxLvayWcp/HjRk+nQTbjM3q5TTmazDU6w0pRrHrVDzRXaVFjk0ZmTpfMx5rVNEz8m0ocSD0iNJiNYgz9cfEZpOCRNUN8XHcd9FtSZAf81t79zFbWL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285355; c=relaxed/simple;
	bh=OsOEHTJ5U5in1wEkrP4n+Apuq2cXdOq92Jbtdpg90hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dom+eFul9lLWHv6VHeb0zQYCVWOPEtjA9r6T5akujQvKg6SzUqO3rXyYqJ3F6EGdCwXgK2OY5wmWuL/FTBfB1ZsT0CVXDCpoBBdKY1A4jMsyWAjZ6JOwjx114YqiUNfZ2znIkfe0Dc8+sdy5bgVGQauf168E/G2JrkaJOXV7xZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z6Sh/5ce; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163affd184so7675ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 13:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736285353; x=1736890153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4yvsaQrMUrrq9MPI20igNRxIiF2iJVeY3n5V9os2bg=;
        b=z6Sh/5ceB0NwLkiWnIoqYHDiSAh73Ct7jJh2OL9brM9gFkWwqYx+JevbsKywt9Ghpr
         8WhCkMiuoBCQvwybEv7nSwZOKwo8eog/DkYApDpBJ3K9dF4GxGxYr0gpKGUjH0gyLwRa
         qB+EzKDAX+2RJnYQ2wzLCyfwCY8qDNkikAXPYWVOnBEXjPT9bb/NAK1UGUry00XU4HXI
         2S0fya6YTwILe/rQA8atOzjqRftAAJwTZcMbSvj8jZmAzS0rnOYoHxmfC8KaYmm+PiSK
         ue9hvFGgjUI5DtpNF33tLeb/bsIfKYNDgMRzMlbMzbyoYaTuGhpyNsluykbMdT5kLw1Y
         soYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736285353; x=1736890153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4yvsaQrMUrrq9MPI20igNRxIiF2iJVeY3n5V9os2bg=;
        b=FdjyVCx3um58xTUbJzFsTD9S6fS7Jzs2pWwgReXFj0TyBz+fugjSG81mAp0oSWz0+L
         ees44adrREzRHaQ5uoRNoP8lcf5ThFFAJFP5NSM/CAouFbkSMwsl/tHsC+/gfvPg1y7M
         93R1yryFiTEHYIsZ7yZMaT0HGoGFNnNrXwOqtMHa4vIlGAiqY+LR5P3FWquXdzwGUrcm
         Z1fpBcf/eCjMPK6i49+4frAgW/HqgFZRY9ah4gqP5oTE2A8qbQXyD+XR/Sqr26AcXJy1
         DXfII8KvxtU1vWs6O2K+gdoAAQxxTR6ozg5Cbz3fZg0cDouNZnsgShfLiwD2V7/YYrHS
         YoTA==
X-Forwarded-Encrypted: i=1; AJvYcCVLgS4T71jQJmem2oh2BImb3acyU8ABsibU+OZz5RUW+4eF5Il0CHT5d0nV0aAsz6IMVJk2+XOReJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5JI/Uob+WxulaB+vn1ZutQLxCXuJ0anV1pJhu7kVTZNZsHWJ
	xKC0FAJ2ntDDENIzXo3C6iKF6GOpGIbjdVH4hVzHqTdjctcqNpGbq2cVXEIS7w==
X-Gm-Gg: ASbGnctm76Ix76Xui7U2ACuzmtXflajQ+WgvMsGm0Q1bxd+X6+P4sg9GL12NLo+9Ks4
	Zq/sXsxAjPXq1hT/t4lcFqkSCj3K1qBfR0xki+aCrZAusLXdd88BIfkGRstFzoYqQ0A9wYnYiJr
	mwY9UMkCwP8JDgboEo7rGLvR59JLGddYWXNWucWuXSUq8sxEFa7CQZvjm1thd++OfeuXEtVRzOS
	LYzR9wxoXGlvlafwJo1TlsPxX5qtjwN+MqHxQJYfZqQFCYp9hGVexNSu3y0500jWn2/noeDAiEa
	FMFjemN3Dc9EL7R87RA=
X-Google-Smtp-Source: AGHT+IEWDsZlogzDB0XzyYchGeAnkHiHP9TjvYM+KlO+Y/4JXyUM5GmM8Qs2UgpL19SqZeUJKwWCXQ==
X-Received: by 2002:a17:902:fb4f:b0:20c:a55b:aef1 with SMTP id d9443c01a7336-21a840fd5damr504765ad.6.1736285353131;
        Tue, 07 Jan 2025 13:29:13 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fccd5sm34019862b3a.168.2025.01.07.13.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 13:29:12 -0800 (PST)
Date: Tue, 7 Jan 2025 21:29:08 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, gregkh@linuxfoundation.org,
	arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, surenb@google.com,
	arnd@arndb.de, masahiroy@kernel.org, bagasdotme@gmail.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	hridya@google.com, smoreland@google.com, kernel-team@android.com
Subject: Re: [PATCH v11 2/2] binder: report txn errors via generic netlink
Message-ID: <Z32cpF4tkP5hUbgv@google.com>
References: <20241218203740.4081865-1-dualli@chromium.org>
 <20241218203740.4081865-3-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218203740.4081865-3-dualli@chromium.org>

On Wed, Dec 18, 2024 at 12:37:40PM -0800, Li Li wrote:
> From: Li Li <dualli@google.com>

> @@ -6137,6 +6264,11 @@ static int binder_release(struct inode *nodp, struct file *filp)
>  
>  	binder_defer_work(proc, BINDER_DEFERRED_RELEASE);
>  
> +	if (proc->pid == proc->context->report_portid) {
> +		proc->context->report_portid = 0;
> +		proc->context->report_flags = 0;

Isn't ->portid the pid from the netlink report manager? How is this ever
going to match a certain proc->pid here? Is this manager supposed to
_also_ open a regular binder fd?

It seems we are tying the cleanup of the netlink interface to the exit
of the regular binder device, correct? This seems unfortunate as using
the netlink interface should be independent.

I was playing around with this patch with my own PoC and now I'm stuck:
  root@debian:~# ./binder-netlink
  ./binder-netlink: nlmsgerr No permission to set flags from 1301: Unknown error -1

Is there a different way to reset the protid?

--
Carlos Llamas

