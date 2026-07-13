Return-Path: <linux-doc+bounces-96578-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sy7TN2UKVWoijQAAu9opvQ
	(envelope-from <linux-doc+bounces-96578-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 17:55:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693B74D4EF
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 17:55:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VORZTIQ4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96578-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96578-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FCC6301A2B5
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 15:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F76301493;
	Mon, 13 Jul 2026 15:54:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2E73054E4
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 15:54:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958053; cv=none; b=TqL31v7WkQ4tQ5gLlxbroyS2z9sii/fXp8voehHFr5Hq6/2wXyQTstphF3/eP+yfclVSHFhCXJra9pbKu6jR6VKw8i2/g8iMeiHhan4JPpJ6oX30K03o+HNYdtQDXzc5ZSJXrFMkK49HUXXI7zG4q7QfHm2zIxwP/KMj9fNETkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958053; c=relaxed/simple;
	bh=uNT75hHkvYptAySgXEmQ+e4sFHUe8f/fW57wwFbihUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0Kl/fdZkEDGCTKyYakU6O8SKVkxtODDE1coKoGJWsCGDRoi/dn7T+YDir7CjSfcbJrht1D+TknoLaiI7TEITBt2LX4t3yAWgXNny0gkLAwSKed22u+qIsc4ieV+w33qYjg6geh2zd2kCS83Vz9ZBognpuUbBVyIMBy4+UrZul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VORZTIQ4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583A21F00A3D
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783958052;
	bh=7Wi+BDV+Li2I45KRRyhG/JcQYyz2VMwpLgz+pmqRyH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VORZTIQ4sVCUpJp9aFjnW5D6DZw9sxWvTk990TFyhM1TCzV7UHqITSDUyKLxh1G0G
	 oX3qPRK53kPcmgoEY1wKO5YqoQyirtrVCFxtff3y7awk2AJaH4GiNZyMJISGNMNa+8
	 8+LqGpEM5Xr0OXDAP7jBrfwgElGP2cerm279gm5b6/ncTIf6NcWHV6XIrOgMGbqbSu
	 dDKQi3cpHs2UkcacMc56vn8Rctjj0az7Pj3bEa6LOlOCMtMWs/nV4rl7UPHZoSf3kc
	 Fdqg1yMy8Fm9crYWr9gFEv+5K0WvdJXTzd183EGvtdjV2NLCPOlnVf6wDBtq4v4gPA
	 BSWn4r2kPT7mA==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e2937e9dso420284266b.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 08:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovMeQEl7C2YznA4Yj7RlrHaqQi5Ha3WcTp0B3kh3LWCezGWROS6gTlZurcLb29l7diymTZs88XWdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF9s8IdHWAMQMvUpqljIgBNhHArReQ6O923P4sjbBPrFjxdEtv
	vpQl/UMisrCdGKH7j7BqkL+en1UyfM8izF49Uq5uN1F3r9Z1N6y6EQWRuRiNNQmLzdwt/9W8zZ9
	yuGbCKnQal4ChQpJbj3sXqARvrHAY6KA=
X-Received: by 2002:a17:907:ea5:b0:c16:63c:a749 with SMTP id
 a640c23a62f3a-c161e8b39b5mr412150066b.18.1783958051252; Mon, 13 Jul 2026
 08:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com> <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com> <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
 <4ec2bd64-af40-8ebf-b8a8-2dd7421a1100@gmail.com> <5ce4035b-7f56-d1d2-2d2a-668446d870e8@gmail.com>
 <CAO9r8zOLe5eJfNmoszCX3rtD=6YEa_7xrvDV1acVDOtZg4vWYA@mail.gmail.com>
 <bf14cfe5-e98e-c20a-231e-37b3a2489040@gmail.com> <CAO9r8zNzRWxCvUok7FJTZZOp6pS9D-Qdrsbi10rLBn4QRhw81A@mail.gmail.com>
 <30c8df43-9464-8fa0-3614-0ca06b97862e@gmail.com>
In-Reply-To: <30c8df43-9464-8fa0-3614-0ca06b97862e@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 13 Jul 2026 08:53:58 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNu=JPZG4be9beJUdBEGRgX6YaD_cpZw2P8WieDY=c06g@mail.gmail.com>
X-Gm-Features: AVVi8Cc-M6D8QIj5nYsgvnSdHgSG_Ul8Jzmth_aCqS10AAfg94WJe5GDwQuLPLM
Message-ID: <CAO9r8zNu=JPZG4be9beJUdBEGRgX6YaD_cpZw2P8WieDY=c06g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96578-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jiahao.kernel@gmail.com,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:nphamcs@gmail.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,gmail.com,kvack.org,vger.kernel.org,lixiang.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8693B74D4EF

On Fri, Jul 10, 2026 at 3:04=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/7/10 04:44, Yosry Ahmed wrote:
> > On Wed, Jul 8, 2026 at 7:15=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com=
> wrote:
> >>
> >>
> >>
> >> On 2026/7/7 03:33, Yosry Ahmed wrote:
> >>> On Thu, Jul 2, 2026 at 5:32=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.c=
om> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2026/7/1 19:45, Hao Jia wrote:
> >>>>>
> >>>>>
> >>>>> On 2026/7/1 00:10, Yosry Ahmed wrote:
> >>>>>>>> Before going through more versions we need to figure out if this=
 will
> >>>>>>>> pivot to be a proactive demotion interfcae for swap tiering.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Yes. Should I drop patches 4-6 in the next version and wait for s=
wap
> >>>>>>> tiering to be finalized?
> >>>>>>> We can try to get the non-memcg parts (patches 1-3) merged upstre=
am
> >>>>>>> first. This would also give them plenty of time to bake and catch=
 any
> >>>>>>> potential regressions. Thoughts?
> >>>>>>
> >>>>>> Patches 1-2 can be sent and merged separately, yes. For patch 2,
> >>>>>> please include some numbers for the writeback performance before a=
nd
> >>>>>> after batching.
> >>>>>
> >>>>> I'd love to collect some performance data. Do you have any recommen=
ded
> >>>>> benchmarks for this?
> >>>>>
> >>>>
> >>>> Perhaps the following test case could work?
> >>>>
> >>>> Test Setup:
> >>>> - Total memory: 32 GB
> >>>> - zswap settings: max_pool_percent=3D1, accept_threshold_percent=3D5=
0,
> >>>> shrinker_enabled=3DN
> >>>> - cgroup constraint: memory.max=3D1G
> >>>> - Workload: Run the following stress-ng command inside the cgroup fo=
r
> >>>> 120s to
> >>>>      continuously force zswap store failures and trigger shrink_work=
er():
> >>>>
> >>>>      bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
> >>>>      exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-=
set -t
> >>>> 120s -q'
> >>>>
> >>>> The following comparison results were collected over multiple runs v=
ia
> >>>> bpftrace
> >>>> and the 'written_back_pages' sysfs interface:
> >>>>
> >>>>                             Baseline         Patched
> >>>> ---------------------------------------------------
> >>>> shrink_worker wakeups       5,587             878
> >>>> shrink_memcg calls      7,823,853       2,347,320
> >>>> written_back                  257         781,214
> >>>>
> >>>> Conclusion:
> >>>> Under the same workload and duration, the patched kernel shows a
> >>>> significant reduction
> >>>> in both shrink_worker wakeups and shrink_memcg calls, while successf=
ully
> >>>> executing a
> >>>> much higher volume of page writebacks.
> >>>
> >>> Hmm this is actually a bit concerning. Yes, we are invoking the
> >>> shrinker less, but we're writing back *a lot* more memory, orders of
> >>> magnitude more. We are using a batch size of 64, and making ~1/3 of
> >>> the calls to shrink_memcg(), so the number of written back pages
> >>> should be ~20x more, not 3000x more? I think I am missing something.
> >>>
> >>> Also, ideally, the batching wouldn't result in significantly more
> >>> writeback, but a similar amount of writeback over less shrinker
> >>> invocations. If we are writing back significantly more pages then the
> >>> batching logic is probably too aggressive?
> >>
> >> Apologies, I think the test I constructed has a bit of a problem. This
> >> test has very, very heavy memory pressure and is already a very abnorm=
al
> >> case.
> >>
> >> The zswap entry returns the first time because of "second chance" afte=
r
> >> setting referenced to false. For the baseline, it scans 1 page per nod=
e
> >> each time for 16 loops. During the test, shrink_worker() basically exi=
ts
> >> at about 16 pages each time.
> >>
> >> Since stress-ng periodically and randomly writes to this 4G memory, it
> >> keeps triggering zswapin and then waiting to zswapout new zswap entrie=
s
> >> after falling below the pool threshold. When the speed of zswapin/out =
is
> >> far greater than the scanning speed of shrink_worker(), a large number
> >> of zswap entries cannot wait until the second scan for writeback. New
> >> entries are stored on the zswap LRU list again, and the referenced of
> >> the new zswap entries is set to true again. During the test, it was
> >> found that 99.21% of the return values of shrink_memcg_cb() in the
> >> baseline kernel were LRU_ROTATE.
> >
> > Hmm if I understand correctly, you are saying that the current
> > upstream code is actually failing to writeback when it should in the
> > previous test case with very high memory pressure, but it is with
> > batching? If that's the case, I think it's actually really good data
> > to include. However, we should make sure that's what's actually
> > happening. If the current shrinker is not keeping up and failing to
> > writeback, we should observe:
> > 1. shrink_worker() hitting MAX_RECLAIM_RETRIES continuously and bailing=
.
> > 2. zswap usage consistently remains at/near the limit, and not going
> > down to the acceptance threshold.
> > 3. zswap_store() failing to accept pages and the pages going directly
> > to disk, causing an LRU inversion (hotter pages on disk, colder pages
> > in zswap).
> >
> > Can you confirm that this is what's observed with the high pressure tes=
t case?
> >
>
> Apologies, my previous explanation might not have been very clear.
>
> For an entry to be written back, the shrinker must scan the *same* entry
> twice: the first scan sets referenced to false and returns ROTATE, and
> only during the second scan can it be written back.
>
> If a swap entry is zswapin'd between the first and second scan (meaning
> the entry is no longer on the zswap LRU), then this swap entry will not
> be written back by the shrinker. Therefore, the second scan must occur
> before this entry is zswapin'd for it to be possible to be written back.
> So, if the baseline scanning speed is far slower than the lifecycle
> speed of the swap entries, it results in only scanning once. In the
> baseline kernel, 99.21% of the return values of shrink_memcg_cb() are
> LRU_ROTATE, while the patched kernel's shrink_worker() scans at least 64
> * 16 entries in a single pass, resulting in only 58.7% of the return
> values of shrink_memcg_cb() being LRU_ROTATE.

Right, my question is, is the high rate of LRU_ROTATE leading to
failure to writeback in a way that causes zswap store failures (and
pages skipping zswap and going directly to swap)?

>
>               Baseline         Patched
> ---------------------------------------------------
> zswapin       929,096          281,196   <----
> zswapout      982,731        1,058,746
>
> After modifying the kernel to remove the "second chance" algorithm, the
> test data of the baseline kernel roughly conforms to our expectations.
>
> Therefore, the constructed test has a bit of a problem. The second test
> case in my previous email can ensure that the entries on the zswap LRU
> are relatively stable.
>
> It is worth noting that the capacity of the zswap pool will not remain
> constant all the time. Since stress-ng periodically writes to and reads
> from this 4G memory, accessing the pages in the zswap pool will trigger
> zswapin, causing the zswap pool size to decrease. Other pages attempting
> to zswapout into zswap via zswap_store() will fail (until the zswap pool
> size becomes 160M (accept_threshold_percent=3D50)), but the zswap_store()
> path will wake up shrink_worker() to try to perform scanning and
> writeback. Then stress-ng will continue to read and write memory,
> continuously triggering zswapin to further reduce the zswap pool size
> until the threshold, at which point shrink_memcg() will also stop. Then,
> new zswap entries (with referenced as true) are added to the zswap LRU
> again via zswap_store(), until the zswap pool size reaches 320MB (32 GB
> (Total memory) * 1%). This process repeats continuously during the test.
>
> Thanks,
> Hao
>

