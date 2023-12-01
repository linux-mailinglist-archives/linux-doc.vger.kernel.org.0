Return-Path: <linux-doc+bounces-3818-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F362A80137C
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 20:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0118280D9C
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 19:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387D13B79D;
	Fri,  1 Dec 2023 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HcXFxiCv"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9ACECD
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 11:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701458151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdAU38sunLi3iNdOgs6QJtMNQj8oAEKkhA1OXN7qLu8=;
	b=HcXFxiCv3OxCaYnovgJDttGja9mF1IdzqnEX/XBgSQb8RyB4YzqROkTweIpqVX81pUMcb6
	VWLTz77yK4bvS8MlZuk2Qh+BoGsT6BoGlLmGtZh4aswfLJ/dKeKIdnIWldJ1NkBMYwgxpR
	u82pL0hOeIMx9/xrnIpNLQGTZknbWiM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-MDA21xNjOkq4PGW5VT-nzA-1; Fri,
 01 Dec 2023 14:15:47 -0500
X-MC-Unique: MDA21xNjOkq4PGW5VT-nzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FAAC380670C;
	Fri,  1 Dec 2023 19:15:47 +0000 (UTC)
Received: from [10.22.17.155] (unknown [10.22.17.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 093CE2026D68;
	Fri,  1 Dec 2023 19:15:45 +0000 (UTC)
Message-ID: <501501ef-137a-4797-9d43-48ea68851147@redhat.com>
Date: Fri, 1 Dec 2023 14:15:44 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>, Jann Horn <jannh@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20231130204817.2031407-1-jannh@google.com>
 <06c05c8b-9a3b-4c04-b898-0f82e98da70f@redhat.com>
 <CAG48ez1a=VuEWwPTjcXFAwCyt9bRH-WzAfw0uP-qVu83kdxkZw@mail.gmail.com>
 <28b147c3d7354d1a8ff0b903da9b54f4@AcuMS.aculab.com>
 <CAG48ez1bOwbqEbD_ycC2fyWK_tW4rqr=gogJbQOx5CECyPGZcg@mail.gmail.com>
 <1bcee696-d751-413c-a2ec-4a8480bae00b@redhat.com>
 <780e652ff52044d4a213cacbd9276cf8@AcuMS.aculab.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <780e652ff52044d4a213cacbd9276cf8@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On 12/1/23 13:44, David Laight wrote:
>
> (Top post due to perverted outluck rules on html)
>
> Pending waiters aren't the problem.
>
Pending waiters can still be a problem if code decides to free the lock 
containing object after a lock/unlock sequence as it may cause 
use-after-free.
>
> You have to ensure there aren't any, but the mutex() can be held.
>
Using reference count to track the number of active users is one way to 
prevent that if you only release the reference count after 
mutex_unlock() returns but not in the lock critical section.

Cheers,
Longman

> David
>
> *From:*Waiman Long <longman@redhat.com>
> *Sent:* 01 December 2023 18:40
> *To:* Jann Horn <jannh@google.com>; David Laight <David.Laight@ACULAB.COM>
> *Cc:* Peter Zijlstra <peterz@infradead.org>; Ingo Molnar 
> <mingo@redhat.com>; Will Deacon <will@kernel.org>; Jonathan Corbet 
> <corbet@lwn.net>; linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
> *Subject:* Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
>
> On 12/1/23 13:18, Jann Horn wrote:
>
>     On Fri, Dec 1, 2023 at 7:12 PM David Laight<David.Laight@aculab.com>  <mailto:David.Laight@aculab.com>  wrote:
>
>         From: Jann Horn
>
>             I think this pattern anyway only works when you're only trying to wait
>
>             for the current holder of the lock, not tasks that are queued up on
>
>             the lock as waiters - so a task initially holds a stable reference to
>
>             some object, then acquires the object's lock, then drops the original
>
>             reference, and then later drops the lock.
>
>             You can see an example of such mutex usage (which is explicitly legal
>
>             with userspace POSIX mutexes, but is forbidden with kernel mutexes) at
>
>             the bottom of the POSIX manpage for pthread_mutex_destroy() at
>
>             <https://pubs.opengroup.org/onlinepubs/007904875/functions/pthread_mutex_destroy.html>  <https://pubs.opengroup.org/onlinepubs/007904875/functions/pthread_mutex_destroy.html>,
>
>             in the section "Destroying Mutexes".
>
>         I don't understand at all what any of this is about.
>
>         You cannot de-initialise, free (etc) a mutex (or any other piece of
>
>         memory for that matter) if another thread can have a reference to it.
>
>         If some other code might be holding the mutex it also might be just
>
>         about to acquire it - you always need another lock of some kind to
>
>         ensure that doesn't happen.
>
>         IIRC pretty much the only time you need to acquire the mutex in the
>
>         free path is if locks are chained, eg:
>
>                  lock(table)
>
>                  entry = find_entry();
>
>                  lock(entry)
>
>                  unlock(table)
>
>                  ...
>
>                  unlock(entry)
>
>         Then the free code has to:
>
>                  lock(table)
>
>                  remove_from_table(entry)
>
>                  lock(entry)
>
>                  unlock(entry)
>
>                  unlock(table)
>
>                  free(entry)
>
>     Yep, this is exactly the kind of code pattern for which I'm trying to
>
>     document that it is forbidden with mutexes (while it is allowed with
>
>     spinlocks).
>
> Actually, even spinlocks may not guarantee the lock/unlock sequence 
> will flush out all the pending waiters in the case of paravirt spinlocks.
>
> Cheers,
> Longman
>
>
>
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, 
> MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
> P *Please consider the environment and don't print this e-mail unless 
> you really need to*
>


