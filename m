Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964773630D1
	for <lists+linux-doc@lfdr.de>; Sat, 17 Apr 2021 17:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236535AbhDQPMS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 17 Apr 2021 11:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34113 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236521AbhDQPMS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Apr 2021 11:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618672311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wpOOK6WyEfT9G+36ImXYA6KEN0QYHqGNtXUv7YEpGBY=;
        b=JdFkheznm0Crwdc8G1jV5agfbuwUAv9mAeUCPLPWtUmCSUNUsSZghBZ+VAizDofA1uJ1fG
        7Ll0YqTeJg1x2SOLwAyD265Qco/xFG4Ii1CypIAoCweWht14GyN7sfWxD88iks2MmJcJOu
        u8fZxACUyyYd2GvaJiSPk+lUY/lgEoc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-KLIr5ZMWOSqF5pNNhmJ2Sw-1; Sat, 17 Apr 2021 11:11:49 -0400
X-MC-Unique: KLIr5ZMWOSqF5pNNhmJ2Sw-1
Received: by mail-ed1-f70.google.com with SMTP id ay2-20020a0564022022b02903824b52f2d8so8765470edb.22
        for <linux-doc@vger.kernel.org>; Sat, 17 Apr 2021 08:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wpOOK6WyEfT9G+36ImXYA6KEN0QYHqGNtXUv7YEpGBY=;
        b=XgPuqq9leSOJ7BR8QxQoulvoTtGaUT/UzTIh/+icnAnpaoWqkXGWk1g34OyI8+eF2V
         gCT9Zp4/IbSwbOZJemfsKKuBZFKAXXYasI+BPbz/IOnGa7db8ovL0CeWkQku8GJTBlOu
         1QaGqMzQcFbGafvlAP6kirXh50oIYA2v2hbKXHYpc4vZdh/onFR7qMfDLI7pMsR8ny5y
         +EXIdQ355Y8DWlKCC30LdnJhtT5AT8u/SuERdjosUxIW+jclqwHjVisbsm5p6nXPzkvT
         USHgbjjWPl6gjuRjhnfv1ADd7gWKT7qmafKebGGq3ck/n352lekzmqIcnPt9e4emGq5b
         T/og==
X-Gm-Message-State: AOAM532O/9hgvTILb7d7U4NEkZtre8uH34YLJP7q483f97MAKAfnsfXL
        uBdIzyTKQz50XI8IDquBv3Qorsf5QWTdo0S12m9xGvmOocwePdcPltDwYoa3u2OUQvfhcl2+k4R
        rSswUIS0x10DIxUUYJkh2
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr15838089edy.142.1618672308239;
        Sat, 17 Apr 2021 08:11:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzPa7FzJB3WobQR/VsWEjbH3PnqaAGBHOD70NNZR4oUpH2Lo59h4+ae3J4Oouybc0kmjxpZQ==
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr15838064edy.142.1618672308034;
        Sat, 17 Apr 2021 08:11:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id o6sm8417188edw.24.2021.04.17.08.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 08:11:47 -0700 (PDT)
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Theodore Ts'o <tytso@mit.edu>,
        Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com> <YHm0DYB08ZI2kuZm@mit.edu>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7035e8a9-4bcd-bc87-4272-7efa6ed5ac53@redhat.com>
Date:   Sat, 17 Apr 2021 17:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YHm0DYB08ZI2kuZm@mit.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16/04/21 17:58, Theodore Ts'o wrote:
> Another fairly common use case is a lockless, racy test of a
> particular field, as an optimization before we take the lock before we
> test it for realsies.  In this particular case, we can't allocate
> memory while holding a spinlock, so we check to see without taking the
> spinlock to see whether we should allocate memory (which is expensive,
> and unnecessasry most of the time):
> 
> alloc_transaction:
> 	/*
> 	 * This check is racy but it is just an optimization of allocating new
> 	 * transaction early if there are high chances we'll need it. If we
> 	 * guess wrong, we'll retry or free the unused transaction.
> 	 */
> 	if (!data_race(journal->j_running_transaction)) {
> 		/*
> 		 * If __GFP_FS is not present, then we may be being called from
> 		 * inside the fs writeback layer, so we MUST NOT fail.
> 		 */
> 		if ((gfp_mask & __GFP_FS) == 0)
> 			gfp_mask |= __GFP_NOFAIL;
> 		new_transaction = kmem_cache_zalloc(transaction_cache,
> 						    gfp_mask);
> 		if (!new_transaction)
> 			return -ENOMEM;
> 	}

 From my limited experience with Rust, things like these are a bit 
annoying indeed, sooner or later Mutex<> just doesn't cut it and you 
have to deal with its limitations.

In this particular case you would use an AtomicBool field, place it 
outside the Mutex-protected struct, and make sure that is only accessed 
under the lock just like in C.
One easy way out is to make the Mutex protect (officially) nothing, i.e. 
Mutex<()>, and handle the mutable fields yourself using RefCell (which 
gives you run-time checking but has some some space cost) or UnsafeCell 
(which is unsafe as the name says).  Rust makes it pretty easy to write 
smart pointers (Mutex<>'s lock guard itself is a smart pointer) so you 
also have the possibility of writing a safe wrapper for the combination 
of Mutex<()> and UnsafeCell.

Another example is when yu have a list of XYZ objects and use the same 
mutex for both the list of XYZ and a field in struct XYZ.  You could 
place that field in an UnsafeCell and write a function that receives a 
guard for the list lock and returns the field, or something like that. 
It *is* quite ugly though.

As an aside, from a teaching standpoint associating a Mutex with a 
specific data structure is bad IMNSHO, because it encourages too 
fine-grained locking.  Sometimes the easiest path to scalability is to 
use a more coarse lock and ensure that contention is extremely rare. 
But it does work for most simple use cases (and device drivers would 
qualify as simple more often than not).

Paolo

