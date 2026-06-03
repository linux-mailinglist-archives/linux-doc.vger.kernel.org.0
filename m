Return-Path: <linux-doc+bounces-90820-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KtIAK8NzIGqi3gAAu9opvQ
	(envelope-from <linux-doc+bounces-90820-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 20:34:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D69763A97D
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 20:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=N+CCQv+k;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90820-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90820-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 311273048C2D
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 18:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C9E3F5BF6;
	Wed,  3 Jun 2026 18:34:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491923F39EB
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 18:34:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511656; cv=pass; b=RtreeZ5otBgru4pK5vThn197xjq9Jil/cfq3GKv6i2qM0FmsYuLkOMraGOu8nEdB6Kh9SvKHsOCLol26y3ogxBOSCfIbETePrrf6pzGdHRWLNcseihJmxkm9F2C2wDSz+66quhLBCuUeeqCfXSVYleGgddKb8NkfKNl+/xDAOBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511656; c=relaxed/simple;
	bh=TH54AoJ4jB9hdDfjGSLbEq+o20RGSclv34XZcGmgbfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4IQGOnL6+x7Hbcashb/ROVqSzyW7x2GflVqAoz6MTCqqoehXOKd+4/E2VIPP/bPnxJyZApdnCpRKNZTvXA6LQSr8rHts6tnlwhOfNLxojmKnDdU4vGkjmeWm/A6jMHhh9xeGxKFh15JZziYh1RS17BWdUSJDMVVCKxWgZQcaug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+CCQv+k; arc=pass smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so4436268f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 11:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780511654; cv=none;
        d=google.com; s=arc-20240605;
        b=A1bNsaINKzqKh1Fjkc+UfoxZZlHr0F8Y+rPmX6vHYQW2gQoz/X3l6R+Kg3Up8AaSbH
         VTbGN5p9gknFcypUaM1I1dpnCwQ4jcACE6jXhNlxRwOB3lKyhb3iAnQI5gkWtAa3/feO
         66Fk3XErrAdwq9f89Dd9qKKJXTQpx2OO11EIuRcCUXQaLleGpDGMoyuBe5eCU93muFVq
         kv1arCO1WC9Am3oxEpFJdymqAucIoKfWmts8mZSrKttswnOef6uMRGLZM8A5zsKKTO+n
         HNi2kcAjCpYyX/RRpdCPQnQPmKKQQqutKHLkBtgDUdlQtF7ki4WFKvBqbbTxIxXAetj8
         sPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TH54AoJ4jB9hdDfjGSLbEq+o20RGSclv34XZcGmgbfU=;
        fh=KUctYCi67sGM9WmXnJYo5UkMbYGubCxCl7LZ1u1aG80=;
        b=i9fPOu2zrOHVdIqaej4FCqdza+cy33vvNN/xftI7NSNQKMTCI9eMH+tOhwdwQluITv
         9KCz0ijF0s3/m5KaJIslHJJpAq5SYF6C9YfJLlINBYzMfbYwoBUUK4NNlv1xbNksGmHC
         C+coiF7grfutwwu6FjSVJSpWPKoAr+n3NPhAQXuEsFeWLK+Rhvmg0Sa9IJVx0SEkYUOe
         GTsrP0CJ0pnXnyCf+qbP11DWlKFYhfTjrIfHeMfnS4A2x1G+5h9JZNuY6y7+xTjp8tfi
         PeQtSgpNmiW8MuYkMVjHHp37iYbeG5/QY2cC91K0s8LIYAozm6gxsyV4DFOoYbMBNgYz
         3lZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780511654; x=1781116454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH54AoJ4jB9hdDfjGSLbEq+o20RGSclv34XZcGmgbfU=;
        b=N+CCQv+kVKVKmtxRQK9EGeWo3HVrpQyjvH/4Fi81KTWnarQ0oTxFLC6es5mR/AuceE
         MLQCHXx3FeOs3qJnJGi3RVCWUFu1Nws/PCvdf9KyI+toEygVetWOpi9yQ7v0HTY7UCtm
         YjfeKa5FlkN+QCrj1Ji5PK3j4kuEiW1lxqQDv0cOfIFo0qpleismYYeIqG3UlY8B9p2H
         aZCJmFM5Kv5bqEaQQkX1l8EBbEQo3GinJQpEt2G1vEKvmHXiukdaiEcKwaS7pEYd3pj3
         r8nc74tFJIKPPEQor1dK3VDQXnEBBIlXD4OXDcWiBej9kWCPPuhFT7a/DWTarcYK5llq
         /JVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780511654; x=1781116454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TH54AoJ4jB9hdDfjGSLbEq+o20RGSclv34XZcGmgbfU=;
        b=HwfdHJ6wCixn8yHm7BDyu1tL0Ih5ZVN48IlGDv2BrXRrGzSnMMww5FtwGNjFS5DFdN
         02JMwqXZS9Zwh1I3umNN81fIH5YtZBxqL4276CDcSxdiA0R576NS7WW0qlpBuiSvmDww
         0ELI+vd26A5+gE2ciuBA99fD4Yw4SGGy4YOHXPYik5totEK+5bJz57lJik4J4te1OGcX
         BbaMItUR3C1bzd0nLTxp/mRBoX4n/zzYj30AlwMLbVDNk7SLZghYEOdn4dsU36qCmqC2
         /QtBq6yAqLM7rwyYy+KAAR6IKkpVa3qagdE9lJCmculQkjAfDTgI8fYSifpbGlewcI4T
         b7sQ==
X-Forwarded-Encrypted: i=1; AFNElJ86BCjKRAwC64sF9DEtv8xMd++Hb3YSl6+Gz/Gicyv/wRsDA4v0TQquYhMQVgcjFErhPQ2g+uTu7Q0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCo44frgUhA8Sl68iHqjRA/gJJ8QRijUNEXc6axaG94quyQRo6
	fndwC0ppta98SgUeBxfRk4mPPUgYFrOyu5E3ClPp8LhIGK5oi99Tlh3PqRo3nScQK0tv9FrcAMl
	ivbph5RgQ4v3gmzXcdEPXDdK/07hb/pU=
X-Gm-Gg: Acq92OFZB0USYAg2doUxeHeIED+7WV/qsebvyNd2jdPLWg6NqKq7tpW0R66V1x5H3TM
	1QbB8HG7l/0YvAYvUVJjRJf0lDHv5ENRwsEXsh/xDMDGe1WvwR6C1XvJm0ws7li7kYbl4OkervA
	5bVxlboEqoVgPIpLUjjoCqomq/3AMu2tsfQ7wmH95KclwzcrF9/EUm/H9wkGS8PjacwZCJul1Gm
	QQ11dXexjCEUzpLfzovmDCUgJQZDK02zwHejAwHtgrB7L2CQ2TzM/OTwePK2+GbQS7yRlkTeGY9
	kfK/+W65qrEYVXw6ZUIG3IyRIR+miR2KaGQUDZu1uSnCb6k/QQ==
X-Received: by 2002:a05:6000:60a:b0:45e:f4f7:7cad with SMTP id
 ffacd0b85a97d-46021980b94mr6753458f8f.39.1780511653643; Wed, 03 Jun 2026
 11:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com> <aho-Z6wshceTAYd9@google.com>
 <ea2c1323-1440-e927-f14a-0eac54a245bf@gmail.com> <CAKEwX=PoBZ4ci30tKHQXs1o9=NDpPrtbe7RxxZTbnzVJf74ZYQ@mail.gmail.com>
 <CAO9r8zMBUMXy_bkeT8z+M=dXayU=6VGEw+-HmfDWR2fyJy=z+A@mail.gmail.com>
In-Reply-To: <CAO9r8zMBUMXy_bkeT8z+M=dXayU=6VGEw+-HmfDWR2fyJy=z+A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 3 Jun 2026 11:34:00 -0700
X-Gm-Features: AVHnY4LBOBaSAnmMiBIxd2EE7a4jNLcFpjuYk3Z2E2kzH2esEzwrCqzQSkwrWXY
Message-ID: <CAKEwX=NQUqqrM9vdYE2KhWEZx-YwPc7YPhfz7xaBrGVDf824bA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:yosry@kernel.org,m:jiahao.kernel@gmail.com,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:cgroups@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90820-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[nphamcs@gmail.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nphamcs@gmail.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,vger.kernel.org,kvack.org,lixiang.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D69763A97D

On Wed, Jun 3, 2026 at 11:26=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > > > Is the main difference that we are scanning in batches here? I thin=
k we
> > > > can have shrink_memcg() do that too. If anything, it might make the
> > > > shrinker more efficient. Over-reclaim is ofc a concern, and especia=
lly
> > > > in the zswap_store() path as the overhead can be noticeable. Maybe =
we
> > > > can parameterize the batch size based on the code path.
> > > >
> > > > Nhat, what do you think?
> > >
> > > Nhat, since we now have the referenced-based second chance algorithm,
> > > should we consider doing batch writeback for shrink_memcg() as well?
> >
> > I just take a look at shrink_memcg() and realized it's reclaiming one
> > page at a time. Thanks for the reminder - I hated it.
> >
> > Please batchify it if it makes your life easier :) We don't reclaim
> > "just one page/object" anywhere else in the reclaim path, Sure, it
> > adds a bit of latency to zswap_store() if we reached cgroup limit, but
> > IMHO if we hit zswap.max limit at zswap_store() time, that is already
> > the slowest of slow path that you should have avoided with proactive
> > reclaim/zswap shrinker in the first place. And, setting zswap.max does
> > not make sense to me in the first place (I can write a whole essay
> > about it).
>
> Should we batchify shrink_memcg() from the shrinker and background
> writeback, but leave the synchronous zswap_store() path to reclaim one
> page for this series at least to avoid potential regressions?
>
> I think this change specifically needs more intensive testing (vs the
> other code paths).

I'm fine with having shrink_memcg() takes a batch_size argument for now :)

I suspect not a lot of people invokes the shrink_memcg() synchronous
path in zswap store though. Setting zswap.max is hard (as it involves
guessing compression ratio ahead of time) and induces quite a bit of
overhead (obj_cgroup_may_zswap() does a force flush for every store if
you set zswap.max to a value other than 0 and max).

