Return-Path: <linux-doc+bounces-3857-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CC3801F1F
	for <lists+linux-doc@lfdr.de>; Sat,  2 Dec 2023 23:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADA4A1C2082E
	for <lists+linux-doc@lfdr.de>; Sat,  2 Dec 2023 22:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF4D2136F;
	Sat,  2 Dec 2023 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MzinU2LP"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0665D119
	for <linux-doc@vger.kernel.org>; Sat,  2 Dec 2023 14:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701556780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W85mzbNqSUgzZhP20j/vWLOVU90yvilCaj5Tmfd4LAI=;
	b=MzinU2LPnY621iUEnV0GH8KGlRsTPc2mqWMcO090wh1LvIvQKMf4eBNtj/yHUmec/e2xKu
	zkr9MqWyJdadTm0QAGR+7CXQYlHJ3B2/JbeSpMofdeggYfE1kexjBOv7Dqe0ZyYS0hOWV0
	zMNbtfYVUNbPrCwJwzh5N/9pup4mBao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-7ALDFyWlNruah0QHQ1fuyw-1; Sat, 02 Dec 2023 17:39:38 -0500
X-MC-Unique: 7ALDFyWlNruah0QHQ1fuyw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99F2A185A780;
	Sat,  2 Dec 2023 22:39:37 +0000 (UTC)
Received: from [10.22.8.11] (unknown [10.22.8.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AF22492BE0;
	Sat,  2 Dec 2023 22:39:37 +0000 (UTC)
Message-ID: <c7c62df7-74bb-416f-b363-274c96b88ae0@redhat.com>
Date: Sat, 2 Dec 2023 17:39:36 -0500
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
 <501501ef-137a-4797-9d43-48ea68851147@redhat.com>
 <f98b04e05c964b57bc27fb895810aaaf@AcuMS.aculab.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <f98b04e05c964b57bc27fb895810aaaf@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On 12/2/23 10:51, David Laight wrote:
> From: Waiman Long
>> Sent: 01 December 2023 19:16
>>
>> On 12/1/23 13:44, David Laight wrote:
>>> Pending waiters aren't the problem.
>>>
>> Pending waiters can still be a problem if code decides to free the lock
>> containing object after a lock/unlock sequence as it may cause
>> use-after-free.
>>> You have to ensure there aren't any, but the mutex() can be held.
>>>
>> Using reference count to track the number of active users is one way to
>> prevent that if you only release the reference count after
>> mutex_unlock() returns but not in the lock critical section.
> I suspect the documentation need to be more explicit than just saying
> it is non-atomic.
> Saying something like:
>
> The mutex structure may be accessed by mutex_unlock() after another
> thread has locked and unlocked the mutex.
>
> So if a reference count is used to ensure a structure remains valid when
> a lock is released (with the item being freed when the count becomes zero)
> the reference count itself cannot be protected by a mutex in the structure.
> So code like:
> 	...
> 	count = --item->refcount;
> 	mutex_unlock(item->mtx);
> 	if (!count)
> 		free(item);
> can lead to a 'use after free' in mutex_unlock().
> However if the refcount is atomic and decremented without the
> mutex held there isn't a problem.
>
> 	David

That is definitely better than saying it is non-atomic which is vague in 
meaning.

Cheers,
Longman


