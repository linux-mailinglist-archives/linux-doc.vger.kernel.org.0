Return-Path: <linux-doc+bounces-896-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B77D4636
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 176F2B20EE5
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2683E5396;
	Tue, 24 Oct 2023 03:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LPSttgk7"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0579C7
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:52:34 +0000 (UTC)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4FB10F4
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:32 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-41cbf8e1f77so23601681cf.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119551; x=1698724351; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qf06v0uPyEibN6HVL4g78GrmaDMN+Y6zqErrL4AHRpg=;
        b=LPSttgk7Qv+YzGWvLuwItsNg1cdw80wadMUUgFQnJQh1lLcRxguvT8dpaBb9zkDHeb
         S1u+ySEcWIXHFfsbzopRwYX83zdwR054lNJplS59qgJGOKnhfouIBAa9k7Tch4IDIqgW
         6DTNjUsOYIJq4sVigcipZdCLuVTv+/hNo3E69ObyRNXPW/eOXJT5uHRgO+WWfwsp73cY
         XH73yHsmO5ZuyFq+HzTv9SLOhpf+9irJ1aKzUCPoENDEQrTf38jFCJjcGOUNRqui160E
         5ODb46TPq3MgBIag8VMrFSW5I5Ofz9Alj7yoo2yyujJ8uKs6HZshqb83wQjtlzmAMPBH
         VQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119551; x=1698724351;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qf06v0uPyEibN6HVL4g78GrmaDMN+Y6zqErrL4AHRpg=;
        b=HDleOFtyHeydlqTc6giVLj63M/EhVlX7Ci6u5d+PTaQjzyAuxZEke8ZJTpokrsXA3G
         Ja52cM7wA1mH040i/amAWJUC/LXbo1DNGp9jAjTF+1x8+ca0hkJJu5NjZQdhmUzY71ql
         xYLvus6zkIKyr2wSWxm0OtsJQpoKBWyB4KC2L7MkIZSmAuc5c4WJt9z3EzI+0v2atmQG
         Gm1HTYOQy/V1hsD8LELDiT7g9z1DRtoGq+BUAgioo/32W+AsZn1++7RptCxXiMzRf4gE
         tdMKlMSo6POhuDNUSH+J7fSfyLKGTXkO3e+D/Q1i95K+LLFqU84HIgOvyL1z5oxpvaj3
         ziAw==
X-Gm-Message-State: AOJu0YxWEbvKM9qNjgufP+kEZwj+YUy6z2k260i0AdMUrevsqQ4MrDGZ
	2WqG+BNACHk2dW1qWmHvlAQp
X-Google-Smtp-Source: AGHT+IGouATwOYXmK2YwrFbZyHQ9JLHk3FA04Mh6g6shppq2ZH5U7Zjd9ZU0vWlK7itlmdw9ByftTg==
X-Received: by 2002:a0c:aa11:0:b0:66d:63ff:80ab with SMTP id d17-20020a0caa11000000b0066d63ff80abmr7949580qvb.7.1698119551260;
        Mon, 23 Oct 2023 20:52:31 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id lg8-20020a056214548800b0066d05ed3778sm3363056qvb.56.2023.10.23.20.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:30 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:30 -0400
Message-ID: <2121d9724f32ea5926574f9aba806b69.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, linux-kernel@vger.kernel.org, Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 12/19] dm: add finalize hook to target_type
References: <1696457386-3010-13-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-13-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> This patch adds a target finalize hook.
> 
> The hook is triggered just before activating an inactive table of a
> mapped device. If it returns an error the __bind get cancelled.
> 
> The dm-verity target will use this hook to attach the dm-verity's
> roothash metadata to the block_device struct of the mapped device.
> 
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v1-v10:
>   + Not present
> ---
>  drivers/md/dm.c               | 12 ++++++++++++
>  include/linux/device-mapper.h |  7 +++++++
>  2 files changed, 19 insertions(+)

We need an ACK and confirmation from Alasdair and/or Mike that this
is the right approach.

> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 64a1f306c96c..3be9cc35306d 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -2239,6 +2239,18 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
>  		goto out;
>  	}
>  
> +	for (unsigned int i = 0; i < t->num_targets; i++) {
> +		struct dm_target *ti = dm_table_get_target(t, i);
> +
> +		if (ti->type->finalize) {
> +			ret = ti->type->finalize(ti);
> +			if (ret) {
> +				old_map = ERR_PTR(ret);
> +				goto out;
> +			}
> +		}
> +	}
> +
>  	old_map = rcu_dereference_protected(md->map, lockdep_is_held(&md->suspend_lock));
>  	rcu_assign_pointer(md->map, (void *)t);
>  	md->immutable_target_type = dm_table_get_immutable_target_type(t);
> diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
> index 69d0435c7ebb..4040e84a8ec7 100644
> --- a/include/linux/device-mapper.h
> +++ b/include/linux/device-mapper.h
> @@ -160,6 +160,12 @@ typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
>   */
>  typedef size_t (*dm_dax_recovery_write_fn)(struct dm_target *ti, pgoff_t pgoff,
>  		void *addr, size_t bytes, struct iov_iter *i);
> +/*
> + * Returns:
> + *  < 0 : error
> + *  = 0 : success
> + */
> +typedef int (*dm_finalize_fn) (struct dm_target *target);
>  
>  void dm_error(const char *message);
>  
> @@ -209,6 +215,7 @@ struct target_type {
>  	dm_dax_direct_access_fn direct_access;
>  	dm_dax_zero_page_range_fn dax_zero_page_range;
>  	dm_dax_recovery_write_fn dax_recovery_write;
> +	dm_finalize_fn finalize;
>  
>  	/* For internal device-mapper use. */
>  	struct list_head list;
> -- 
> 2.25.1

--
paul-moore.com

