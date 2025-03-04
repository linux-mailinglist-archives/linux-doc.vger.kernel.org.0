Return-Path: <linux-doc+bounces-39960-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99497A4EE9B
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 21:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FF097A9285
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 20:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94EF25F965;
	Tue,  4 Mar 2025 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T4oTxsjg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95224C093
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121058; cv=none; b=n0kVygRgh4lRQerVfkY47QnYa0LcPeRUS3l5lcbqvyFDRQjUCUMcd0p5JWVR5PCYB0sTC59tsm3qcxdJP4YQlf6zyO55DO/u3rfI3CRLvdEq48fGxrtD7n/KkvHyKj0nQRCIfWzOAHUmVmW14Z1ogM97ebouw+FYXAGlnv/I4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121058; c=relaxed/simple;
	bh=7y6Ozzze4KwoBgjyzA+U/rpI+/mDiB9TlO4Of3/kd6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFObZvP35qqXtCDK8yucy0/kRovxrX7ftzNpN4DIa+lt/DIXKcjn8AA3leu6NaFL1JR7JiwGHJO80m/zguNs4MdZ7MFTa2+lXgoNUyxIGxnMye92NhZeShSZjoLE6LxXAFJABL/O7YjLxn0M03kC8uXpiV7VmSjB5kaqn3RF/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T4oTxsjg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223a0da61easo37065ad.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 12:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741121056; x=1741725856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6GyiO/b+/JHP4j/mZ3p/+VCJ12NtmyK1qhKdqkLMCk=;
        b=T4oTxsjgaA8+y24tfCQAKQEckcXRTKyOiLFppTyllmgm4nbUjtlaUOxQxZuAZIE0/F
         8SXR9R30apusepH7lhfZeeP8xqlVlKXD5des6pHMpZs9CoUg7y2/xHJrWusp9ESqjYla
         YsQ7hb8du6XQoqbsHIkqli/YZ38seWvmI4BPOr9T1XiHDFYmYKSHUaABquTC5JF5q1Qr
         /TnFkTU83jggTk1WgyhLvLtEssVzF4tubiiMKAIxZV5WPAZ2pyEgtcau15SkJ9g0EPJW
         hmHl3xoadoewQe2Ewe3QBu9VMekEoRaER3N+ODexNoD+ZunWiIsR/Z23UHtcuNT+0+Hp
         gbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741121056; x=1741725856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6GyiO/b+/JHP4j/mZ3p/+VCJ12NtmyK1qhKdqkLMCk=;
        b=KTpQVhm6P8ZO8RtGgXYMSMwUGzMOxgbeVSm2rxlkoDZHVGRZWZoy7xGpFYC6gp/5qC
         GBxN/hVmaFpDHDPsxFSISz9AXPKSjQONYxMhyp2s/HsRv5BETDFn1r9F7wUpcqEV2gRV
         A6ErdbbGuWxnMd/Aqso4C5ju9Kbue65MQGRgrmeqZU7HD/2Ari/Rfk6hIzBK/uVbGy/w
         80l79i0xOFGMPkJaXgyKzhdGSjHGcyNwaExd9OyiZkP0Eg0EG/O5mWoFA1miVgnH4Bmw
         6yJIkdydpEoeXTAcpkXU/Bmko1RyMAsDlXKhBhGLwgxhORU96uDGsjNcYqwnlPYQCx6T
         Rvlw==
X-Forwarded-Encrypted: i=1; AJvYcCXiTs5w+7qFC0MpVzU/AwQfvALUDDO1ncH9kCTUOhRcPbkv+gExOsA795IYezqzRBMmNLM5hba2l14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhEbCBE14mRhsJRnoV2sDztBHAU3JDWl409TIqTULrBWkzNmd6
	xtII8MWO32WzYGB5FmWdYDiURsx1GSXHPcQpBjbgNjGpNr7DBf9GGQM0px8jcw==
X-Gm-Gg: ASbGncs6fBvLIIHImTvKw3FMRoSCDf7GIUjj8lLgQsRKbtexpaB/n6OkO8wVsKCouCM
	UAZGP8/QoFXBHGkRYRQhsWSBfz3E1bNYCLSRMRwbVPENIq/Y6d+OQOUswV5eyMAcnmkqdtC4S2w
	mDIWsczwe8bYIc0UXuNhSXn3ShTWTopVU00JllSfamvKzwZQ3izG+5GfleRAdp+kUEM63eS9a/2
	wqLzz8P6vKtslBqB8Gz18J/KBnZamCIqYxniXgJO2oaph73TBMNvjPTdxAy8XedsKWI/r97kwDA
	4oZuZLZsMw4Nt7v+TUq6Z5klJ24rLUY71c+G9IH0epPvUKcA808Z01c/xgd4P/07arntw/fcCvR
	QVnenDQ==
X-Google-Smtp-Source: AGHT+IF9jAAYtjI1xJD9q8aFzdqcCf3EBmPfCXO9SbqGxq/rnItvqWNyYmnWqD98oJASF+nZMTNy6g==
X-Received: by 2002:a17:902:f681:b0:21f:56e5:daee with SMTP id d9443c01a7336-223f268a154mr502695ad.6.1741121056131;
        Tue, 04 Mar 2025 12:44:16 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c5csm100141995ad.113.2025.03.04.12.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 12:44:15 -0800 (PST)
Date: Tue, 4 Mar 2025 20:44:02 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jeroen de Borst <jeroendb@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Willem de Bruijn <willemb@google.com>,
	David Ahern <dsahern@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Shuah Khan <shuah@kernel.org>, sdf@fomichev.me,
	asml.silence@gmail.com, dw@davidwei.uk,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Victor Nogueira <victor@mojatatu.com>,
	Pedro Tammela <pctammela@mojatatu.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v6 3/8] net: devmem: Implement TX path
Message-ID: <Z8dmEu_p68X7tfq7@google.com>
References: <20250227041209.2031104-1-almasrymina@google.com>
 <20250227041209.2031104-4-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227041209.2031104-4-almasrymina@google.com>

On Thu, Feb 27, 2025 at 04:12:04AM +0000, Mina Almasry wrote:
>  int mp_dmabuf_devmem_init(struct page_pool *pool)
> diff --git a/net/core/devmem.h b/net/core/devmem.h
> index 946f2e015746..67168aae5e5b 100644
> --- a/net/core/devmem.h
> +++ b/net/core/devmem.h
> @@ -23,8 +23,9 @@ struct net_devmem_dmabuf_binding {
>  
>  	/* The user holds a ref (via the netlink API) for as long as they want
>  	 * the binding to remain alive. Each page pool using this binding holds
> -	 * a ref to keep the binding alive. Each allocated net_iov holds a
> -	 * ref.
> +	 * a ref to keep the binding alive. The page_pool does not release the
> +	 * ref until all the net_iovs allocated from this binding are released
> +	 * back to the page_pool.
>  	 *
>  	 * The binding undos itself and unmaps the underlying dmabuf once all
>  	 * those refs are dropped and the binding is no longer desired or in
> @@ -32,7 +33,10 @@ struct net_devmem_dmabuf_binding {
>  	 *
>  	 * net_devmem_get_net_iov() on dmabuf net_iovs will increment this
>  	 * reference, making sure that the binding remains alive until all the
> -	 * net_iovs are no longer used.
> +	 * net_iovs are no longer used. net_iovs allocated from this binding
> +	 * that are stuck in the TX path for any reason (such as awaiting
> +	 * retransmits) hold a reference to the binding until the skb holding
> +	 * them is freed.
>  	 */
>  	refcount_t ref;
>  
> @@ -48,6 +52,14 @@ struct net_devmem_dmabuf_binding {
>  	 * active.
>  	 */
>  	u32 id;
> +
> +	/* Array of net_iov pointers for this binding, sorted by virtual
> +	 * address. This array is convenient to map the virtual addresses to
> +	 * net_iovs in the TX path.
> +	 */
> +	struct net_iov **tx_vec;
> +
> +	struct work_struct unbind_w;
>  };
>  
>  #if defined(CONFIG_NET_DEVMEM)
> @@ -64,14 +76,17 @@ struct dmabuf_genpool_chunk_owner {
>  	dma_addr_t base_dma_addr;
>  };
>  
> -void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding);
> +void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
>  struct net_devmem_dmabuf_binding *
> -net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
> -		       struct netlink_ext_ack *extack);
> +net_devmem_bind_dmabuf(struct net_device *dev,
> +		       enum dma_data_direction direction,
> +		       unsigned int dmabuf_fd, struct netlink_ext_ack *extack);
> +struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
>  void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding);
>  int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
>  				    struct net_devmem_dmabuf_binding *binding,
>  				    struct netlink_ext_ack *extack);
> +void net_devmem_bind_tx_release(struct sock *sk);
>  
>  static inline struct dmabuf_genpool_chunk_owner *
>  net_devmem_iov_to_chunk_owner(const struct net_iov *niov)
> @@ -100,10 +115,10 @@ static inline unsigned long net_iov_virtual_addr(const struct net_iov *niov)
>  	       ((unsigned long)net_iov_idx(niov) << PAGE_SHIFT);
>  }
>  
> -static inline void
> +static inline bool
>  net_devmem_dmabuf_binding_get(struct net_devmem_dmabuf_binding *binding)
>  {
> -	refcount_inc(&binding->ref);
> +	return refcount_inc_not_zero(&binding->ref);
>  }
>  
>  static inline void
> @@ -112,7 +127,8 @@ net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
>  	if (!refcount_dec_and_test(&binding->ref))
>  		return;
>  
> -	__net_devmem_dmabuf_binding_free(binding);
> +	INIT_WORK(&binding->unbind_w, __net_devmem_dmabuf_binding_free);
> +	schedule_work(&binding->unbind_w);
>  }
>  
>  void net_devmem_get_net_iov(struct net_iov *niov);
> @@ -123,6 +139,11 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding);
>  void net_devmem_free_dmabuf(struct net_iov *ppiov);
>  
>  bool net_is_devmem_iov(struct net_iov *niov);
> +struct net_devmem_dmabuf_binding *
> +net_devmem_get_binding(struct sock *sk, unsigned int dmabuf_id);
> +struct net_iov *
> +net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding, size_t addr,
> +		       size_t *off, size_t *size);
>  
>  #else
>  struct net_devmem_dmabuf_binding;
> @@ -140,18 +161,23 @@ static inline void net_devmem_put_net_iov(struct net_iov *niov)
>  {
>  }
>  
> -static inline void
> -__net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
> +static inline void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
>  {
>  }
>  
>  static inline struct net_devmem_dmabuf_binding *
>  net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
> +		       enum dma_data_direction direction,
>  		       struct netlink_ext_ack *extack)

The order of arguments differs from the above definition (and also with
the one in the net/core/devmem.c file) which could cause a failure in
case CONFIG_NET_DEVMEM=n. I think it should instead be:

 static inline struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, 
+		       enum dma_data_direction direction,
+		       unsigned int dmabuf_fd, struct netlink_ext_ack *extack)

>  {
>  	return ERR_PTR(-EOPNOTSUPP);
>  }
>  

Thanks,
Praan

