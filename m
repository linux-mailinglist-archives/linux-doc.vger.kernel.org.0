Return-Path: <linux-doc+bounces-886-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C007D45E8
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22CB01C203C1
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946F02107;
	Tue, 24 Oct 2023 03:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPPLaUHf"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6E51FAD;
	Tue, 24 Oct 2023 03:26:10 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447D183;
	Mon, 23 Oct 2023 20:26:09 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-77891c236fcso311438285a.3;
        Mon, 23 Oct 2023 20:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698117968; x=1698722768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5owIIMWHjveV3iNUQ2MkLe82JwsUOoqZbf2HycPTaSY=;
        b=YPPLaUHfbzGt5SFjkw2ZCi59ja2dWTp0HegmhLNtlCysXHNSFmqaZ1emb3Rqx9Jve9
         TYUvkfQkKddOEn4UcVf5Puf5ocRAKjASGxKOpy2b9KWocq7/gT9/9fdnB64Z6yGAWr/c
         udz4j8y//jxAykzDvcq3Par/W8ihNnpi6AJd9jwGmb2hJf700WBgUtfBnpDNBI0O94ip
         RDFhxui824SsF5Lmd2WfHyAdLzRKv62hsPupZB7UdRgNdaBI7rd1u64bVJWG2FDSmXlQ
         S2FNDwhZNQuhJXesIuP0f2rlyvSjElu/87MLMe+HbLy/yO8zsgpeAoCc34hp1CZiV2Tt
         BKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698117968; x=1698722768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5owIIMWHjveV3iNUQ2MkLe82JwsUOoqZbf2HycPTaSY=;
        b=Nkask539xEFMz/h2HAUJkHcE7xweiMWr5e2DVSDGthGf8QFrIuW6a/YgMM8FqCrFMs
         9XuuXVTcQ1PYF85GZFqu5PPVIYwyAh3b5j5UkcQe1v6OOslKnreILnGQWnjBa3TsZxsk
         T9bph+B4+3Sp5AqhKEvEOi9NC+ab1ZV+PskwPRTPJu/ISTI7m1roZbRiNcrpHGdEgQ0S
         w5/UL2omHfbXWjXUjO3QP7DFhtnnAGNTe0TWimmrAIVFiGGUSHbwqpfmguBVprPYk6mE
         GJ6Erdqc+snXmfPbCcsCMEgK/A0aZ6SmRCS5kVevr8JSJd/u2xdIJyuzEUZV4KORPBV9
         aHmw==
X-Gm-Message-State: AOJu0Yzk4YeFse0QHFc82hBr72jnomDp0865jf1YBomj5DLfYwe1WDz5
	7JS4EKMIk5XphpLvKC8oMVZw7QvvX/Y=
X-Google-Smtp-Source: AGHT+IHAqHRftchKIIm+zyE5nIYAlvq5MPiTMBcP8i5hwCmJXUwc8mYNL/w2F6CO4hJEhTWStLucIw==
X-Received: by 2002:a05:620a:388f:b0:778:96ec:661 with SMTP id qp15-20020a05620a388f00b0077896ec0661mr10769454qkn.73.1698117968265;
        Mon, 23 Oct 2023 20:26:08 -0700 (PDT)
Received: from localhost ([205.220.129.17])
        by smtp.gmail.com with ESMTPSA id i5-20020a05620a074500b0077434d0f06esm1534578qki.52.2023.10.23.20.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:26:07 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 23 Oct 2023 17:25:57 -1000
From: Tejun Heo <tj@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH-cgroup 3/4] cgroup/cpuset: Keep track of CPUs in isolated
 partitions
Message-ID: <ZTc5RXWemIhfrAlS@mtj.duckdns.org>
References: <20231013181122.3518610-1-longman@redhat.com>
 <20231013181122.3518610-4-longman@redhat.com>
 <ZS-kt6X5Dd1lktAw@slm.duckdns.org>
 <9e2772e3-f615-5e80-6922-5a2dd06a8b07@redhat.com>
 <ZTAfM0msp8Cg-qLy@slm.duckdns.org>
 <59448803-ac86-0762-d828-c3eba431ceb4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59448803-ac86-0762-d828-c3eba431ceb4@redhat.com>

Hello, Waiman.

On Wed, Oct 18, 2023 at 02:24:00PM -0400, Waiman Long wrote:
> If you mean saving the exclusion cpumask no matter who the caller is, we can
> add another exclusion cpumask to save it and expose it to sysfs. This should
> be done in the first workqueue patch, not as part of this patch. I expose
> this isolated cpumask for testing purpose to be checked by the
> test_cpuset_prs.sh script for correctness. As said, I can expose it without
> cgroup_debug if you think the information is useful in general.

I don't really care where the cpumask is in the source tree. I just want all
the workqueue cpumasks presented to the userspace in a single place. Also, I
think it makes sense to publish it to userspace in an easily accessible
manner as what the eventual configuration ends up being can be confusing and
the effect it has on the system subtle.

Thanks.

-- 
tejun

