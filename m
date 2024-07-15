Return-Path: <linux-doc+bounces-20717-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107A9317EF
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 17:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AAE82814FB
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 15:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA50E556;
	Mon, 15 Jul 2024 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=malat-biz.20230601.gappssmtp.com header.i=@malat-biz.20230601.gappssmtp.com header.b="Dmx8UYpw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38D1758F
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721059021; cv=none; b=P2U604WuKeDC5eqsyGvEQ+OBwFec90gkpDeZrW0SL02Cic2RQXBYcOOI+fnMrAqIfCwoHpmY/UK1U+I6UjTT7/Qvwa9cCRw1WL0z4j+U5xZ17faRfxe56uJYfIUJVHjRP/vkOKZenvrejkDUbK+8achPNGhtjspjxkk1CPaFeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721059021; c=relaxed/simple;
	bh=ZBtcNEWCuxhE/P0iBIIXs/8CPUxtsXT1UYTc2Z9/CtU=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gC11mU11pa8sAA1YHsXZ8OGnHJ7QdA7YPrhhjVK5SLaAI/pjP1sFZbiTJw4ZRlDRmhs/jjRW9HdybnNHhxRsfJ8qA32yRlfOX6d+PT1jLF+1+lkRjhVcSs9gN5N8YQz2pIGguCln5OWw0AMIGZSnHZ9IMe0FxnZxPrDV3h7bmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=malat.biz; spf=none smtp.mailfrom=malat.biz; dkim=pass (2048-bit key) header.d=malat-biz.20230601.gappssmtp.com header.i=@malat-biz.20230601.gappssmtp.com header.b=Dmx8UYpw; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=malat.biz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=malat.biz
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4ef76f04977so1544066e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malat-biz.20230601.gappssmtp.com; s=20230601; t=1721059017; x=1721663817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NIlhy0lO57++coqHRC76uJUG9zQeSE560AUgvjRiuDo=;
        b=Dmx8UYpwDkTjJ6GOwgwX9IUhKZpTKd5vNjM38Q1pR9YSeAloZS/Z0MTOXpNHoQXq6Q
         TgL8dPL3izZAJHActixyBz5zCCDKnw9JsRX/dLoMbgSuP0YhPkb9/682Dc17UAaubhtA
         9/BbIzR+EAf3LP3yc7U6CugJQ1WOJ/PK5gYy8GIoA7L5VgQpjQ6hQJZHoIToU/BOl7o8
         53i5EPEvbqj42UD31scJlPob84vLJkGOxniItSC5I5RO+qY7WRdJ1NiBJ4Y9BFqhU/3i
         ZGcUNw6HwP1vh6SZ1XGeAgcqIKYRRY+UmR7oDO58NWdqn7iWsmAHv+Yiyi87eKVCmDAT
         7QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721059017; x=1721663817;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIlhy0lO57++coqHRC76uJUG9zQeSE560AUgvjRiuDo=;
        b=vfjkSCZJTQMSpLvVQH2dwl+00cRPrNPR3+DB1ZioBXdOOHu4CMcIpjak/QVyKZxQPv
         aS5f5Y2JSlMvopKy2sPKrDNZslZdV5UN9LjNWncq3/Q4YWz8VauemIXKgCvrruST+hab
         b0p9KGt71sBH26BYeH4Lb/3LlYtFEzZ99ned8XQ+IsY4Ec1F0uKxA9BGREOezUvbeNSn
         K150bdsGj4FibKyvLYpUVPmXY/uiahkSBSPc2t2+ivtV68NGuKVxLk5m4f1d0IrSSZAq
         p4F82h1m5FJMZ+sFTB2oHc8AtWgHovA138Vf/1syhurlID9oU3POWP0TBJneIFFqEZcc
         JGAg==
X-Forwarded-Encrypted: i=1; AJvYcCVsh56Q1TJG0QKgJfoMqWcIYcCpg/ln6V7KAZt31oRp+1TUT0K+7Dl5y8EAjvKVpo1pgwHWWQxso6GHB63wNZN7Ra9ZMXf0fHEK
X-Gm-Message-State: AOJu0YxtAmQweqVIrEtwQn0WZLRLjh1Pnx6aUsP3tufdr7WFQLWu2wzq
	j2AjqYNodUzMRxfHpjXVhsP04Ja/aMZATTskichn/PLJJitJFMN0Wol19zA4CJ1K2rD26xLcgpH
	jMvrDmYIupMS0Nrfo3up7Kq4Arerh36AcOVak
X-Google-Smtp-Source: AGHT+IEmzZqImG52QCCrXwn9JJsfJfxkA/GrxQgE9tQ6QY334XrPRQCbcN4FcvO2F6j15dGqOU5nJSRvlsuk4rTZEuU=
X-Received: by 2002:a05:6122:d8f:b0:4ef:5744:483 with SMTP id
 71dfb90a1353d-4f4cd2b16aemr416439e0c.6.1721059015976; Mon, 15 Jul 2024
 08:56:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jul 2024 08:56:55 -0700
From: Petr Malat <oss@malat.biz>
References: <20240617143945.454888-1-longman@redhat.com> <20240617143945.454888-5-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240617143945.454888-5-longman@redhat.com>
Date: Mon, 15 Jul 2024 08:56:55 -0700
Message-ID: <CANMuvJkDjuPpcqMBM+zzNL3wA-1zVrshrMuy22kQKmLDxbsB7Q@mail.gmail.com>
Subject: Re: [PATCH-cgroup v2 4/5] cgroup/cpuset: Make cpuset.cpus.exclusive
 independent of cpuset.cpus
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Xavier <ghostxavier@sina.com>, Peter Hunt <pehunt@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi,
I finally got some time to test this and it works exactly as we needed it to.
Thanks a lot,
  Petr

On Mon, Jun 17, 2024 at 10:39:44AM -0400, Waiman Long wrote:
> The "cpuset.cpus.exclusive.effective" value is currently limited to a
> subset of its "cpuset.cpus". This makes the exclusive CPUs distribution
> hierarchy subsumed within the larger "cpuset.cpus" hierarchy. We have to
> decide on what CPUs are used locally and what CPUs can be passed down as
> exclusive CPUs down the hierarchy and combine them into "cpuset.cpus".
>
> The advantage of the current scheme is to have only one hierarchy to
> worry about. However, it make it harder to use as all the "cpuset.cpus"
> values have to be properly set along the way down to the designated remote
> partition root. It also makes it more cumbersome to find out what CPUs
> can be used locally.
>
> Make creation of remote partition simpler by breaking the
> dependency of "cpuset.cpus.exclusive" on "cpuset.cpus" and make
> them independent entities. Now we have two separate hierarchies -
> one for setting "cpuset.cpus.effective" and the other one for setting
> "cpuset.cpus.exclusive.effective". We may not need to set "cpuset.cpus"
> when we activate a partition root anymore.
>
> Also update Documentation/admin-guide/cgroup-v2.rst and cpuset.c comment
> to document this change.
>
> Suggested-by: Petr Malat <oss@malat.biz>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  4 +-
>  kernel/cgroup/cpuset.c                  | 67 +++++++++++++++++--------
>  2 files changed, 49 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 722e4762c4e0..2e4e74bea6ef 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2380,8 +2380,8 @@ Cpuset Interface Files
>  	cpuset-enabled cgroups.
>
>  	This file shows the effective set of exclusive CPUs that
> -	can be used to create a partition root.  The content of this
> -	file will always be a subset of "cpuset.cpus" and its parent's
> +	can be used to create a partition root.  The content
> +	of this file will always be a subset of its parent's
>  	"cpuset.cpus.exclusive.effective" if its parent is not the root
>  	cgroup.  It will also be a subset of "cpuset.cpus.exclusive"
>  	if it is set.  If "cpuset.cpus.exclusive" is not set, it is
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 144bfc319809..fe76045aa528 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -87,7 +87,7 @@ static const char * const perr_strings[] = {
>  	[PERR_NOTEXCL]   = "Cpu list in cpuset.cpus not exclusive",
>  	[PERR_NOCPUS]    = "Parent unable to distribute cpu downstream",
>  	[PERR_HOTPLUG]   = "No cpu available due to hotplug",
> -	[PERR_CPUSEMPTY] = "cpuset.cpus is empty",
> +	[PERR_CPUSEMPTY] = "cpuset.cpus and cpuset.cpus.exclusive are empty",
>  	[PERR_HKEEPING]  = "partition config conflicts with housekeeping setup",
>  };
>
> @@ -127,19 +127,28 @@ struct cpuset {
>  	/*
>  	 * Exclusive CPUs dedicated to current cgroup (default hierarchy only)
>  	 *
> -	 * This exclusive CPUs must be a subset of cpus_allowed. A parent
> -	 * cgroup can only grant exclusive CPUs to one of its children.
> +	 * The effective_cpus of a valid partition root comes solely from its
> +	 * effective_xcpus and some of the effective_xcpus may be distributed
> +	 * to sub-partitions below & hence excluded from its effective_cpus.
> +	 * For a valid partition root, its effective_cpus have no relationship
> +	 * with cpus_allowed unless its exclusive_cpus isn't set.
>  	 *
> -	 * When the cgroup becomes a valid partition root, effective_xcpus
> -	 * defaults to cpus_allowed if not set. The effective_cpus of a valid
> -	 * partition root comes solely from its effective_xcpus and some of the
> -	 * effective_xcpus may be distributed to sub-partitions below & hence
> -	 * excluded from its effective_cpus.
> +	 * This value will only be set if either exclusive_cpus is set or
> +	 * when this cpuset becomes a local partition root.
>  	 */
>  	cpumask_var_t effective_xcpus;
>
>  	/*
>  	 * Exclusive CPUs as requested by the user (default hierarchy only)
> +	 *
> +	 * Its value is independent of cpus_allowed and designates the set of
> +	 * CPUs that can be granted to the current cpuset or its children when
> +	 * it becomes a valid partition root. The effective set of exclusive
> +	 * CPUs granted (effective_xcpus) depends on whether those exclusive
> +	 * CPUs are passed down by its ancestors and not yet taken up by
> +	 * another sibling partition root along the way.
> +	 *
> +	 * If its value isn't set, it defaults to cpus_allowed.
>  	 */
>  	cpumask_var_t exclusive_cpus;
>
> @@ -230,6 +239,17 @@ static struct list_head remote_children;
>   *   2 - partition root without load balancing (isolated)
>   *  -1 - invalid partition root
>   *  -2 - invalid isolated partition root
> + *
> + *  There are 2 types of partitions - local or remote. Local partitions are
> + *  those whose parents are partition root themselves. Setting of
> + *  cpuset.cpus.exclusive are optional in setting up local partitions.
> + *  Remote partitions are those whose parents are not partition roots. Passing
> + *  down exclusive CPUs by setting cpuset.cpus.exclusive along its ancestor
> + *  nodes are mandatory in creating a remote partition.
> + *
> + *  For simplicity, a local partition can be created under a local or remote
> + *  partition but a remote partition cannot have any partition root in its
> + *  ancestor chain except the cgroup root.
>   */
>  #define PRS_MEMBER		0
>  #define PRS_ROOT		1
> @@ -709,6 +729,19 @@ static inline void free_cpuset(struct cpuset *cs)
>  	kfree(cs);
>  }
>
> +/* Return user specified exclusive CPUs */
> +static inline struct cpumask *user_xcpus(struct cpuset *cs)
> +{
> +	return cpumask_empty(cs->exclusive_cpus) ? cs->cpus_allowed
> +						 : cs->exclusive_cpus;
> +}
> +
> +static inline bool xcpus_empty(struct cpuset *cs)
> +{
> +	return cpumask_empty(cs->cpus_allowed) &&
> +	       cpumask_empty(cs->exclusive_cpus);
> +}
> +
>  static inline struct cpumask *fetch_xcpus(struct cpuset *cs)
>  {
>  	return !cpumask_empty(cs->exclusive_cpus) ? cs->exclusive_cpus :
> @@ -1593,7 +1626,7 @@ EXPORT_SYMBOL_GPL(cpuset_cpu_is_isolated);
>   * Return: true if xcpus is not empty, false otherwise.
>   *
>   * Starting with exclusive_cpus (cpus_allowed if exclusive_cpus is not set),
> - * it must be a subset of cpus_allowed and parent's effective_xcpus.
> + * it must be a subset of parent's effective_xcpus.
>   */
>  static bool compute_effective_exclusive_cpumask(struct cpuset *cs,
>  						struct cpumask *xcpus)
> @@ -1603,12 +1636,7 @@ static bool compute_effective_exclusive_cpumask(struct cpuset *cs,
>  	if (!xcpus)
>  		xcpus = cs->effective_xcpus;
>
> -	if (!cpumask_empty(cs->exclusive_cpus))
> -		cpumask_and(xcpus, cs->exclusive_cpus, cs->cpus_allowed);
> -	else
> -		cpumask_copy(xcpus, cs->cpus_allowed);
> -
> -	return cpumask_and(xcpus, xcpus, parent->effective_xcpus);
> +	return cpumask_and(xcpus, user_xcpus(cs), parent->effective_xcpus);
>  }
>
>  static inline bool is_remote_partition(struct cpuset *cs)
> @@ -1887,8 +1915,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>  	 */
>  	adding = deleting = false;
>  	old_prs = new_prs = cs->partition_root_state;
> -	xcpus = !cpumask_empty(cs->exclusive_cpus)
> -		? cs->effective_xcpus : cs->cpus_allowed;
> +	xcpus = user_xcpus(cs);
>
>  	if (cmd == partcmd_invalidate) {
>  		if (is_prs_invalid(old_prs))
> @@ -1916,7 +1943,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>  		return is_partition_invalid(parent)
>  		       ? PERR_INVPARENT : PERR_NOTPART;
>  	}
> -	if (!newmask && cpumask_empty(cs->cpus_allowed))
> +	if (!newmask && xcpus_empty(cs))
>  		return PERR_CPUSEMPTY;
>
>  	nocpu = tasks_nocpu_error(parent, cs, xcpus);
> @@ -3130,9 +3157,9 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>  				       ? partcmd_enable : partcmd_enablei;
>
>  		/*
> -		 * cpus_allowed cannot be empty.
> +		 * cpus_allowed and exclusive_cpus cannot be both empty.
>  		 */
> -		if (cpumask_empty(cs->cpus_allowed)) {
> +		if (xcpus_empty(cs)) {
>  			err = PERR_CPUSEMPTY;
>  			goto out;
>  		}
> --
> 2.39.3
>

