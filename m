Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B79C1718B0
	for <lists+linux-doc@lfdr.de>; Thu, 27 Feb 2020 14:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgB0N3F (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Feb 2020 08:29:05 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:46169 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbgB0N2k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 08:28:40 -0500
Received: by mail-qv1-f66.google.com with SMTP id bo12so640424qvb.13
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iGBwlRPOz0RFCrlO5EPuWAgJWFzfpEoFMahebMifJ5o=;
        b=QQgxfMHmsxqGnYaUMtIeeRwYnSCEYuE25sLHZ//sKgE57AEzj0NzxYE0zgGvUwUxZo
         W4lqe04uKi0TkwrCASE+i4dnfMWXThYFRLm+DwjoP/Bw2oUXOiIcurNdI4YZN0xLu5u4
         S6CIgHarbdg6MHidTwrOFK4xWBUYJgT5VDinc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iGBwlRPOz0RFCrlO5EPuWAgJWFzfpEoFMahebMifJ5o=;
        b=T1JjDs2HjqE+1y/T+uWg4mLMHQM7PMwHTtg64A2ZVjgqADTZceumsYCEQK1MGg+r1X
         wNJjmnVbIh2Rrzo0nttiJp0yzYLc9MoPNPVNxSxwh+ClwnuS4r1I74FsidZTZLUAPQhZ
         3kqfCTU91qu1h0NuHRxOppPkabiHj1UJAfvjSagb7xW+L/uC2m4IQ7vQFLM6b5cPcAXE
         tIdQPEvPWq/KFZAZK2r4HU+fV53qZDut9Uohe4sS8WOpAgCVpEl5we0h3SKtk4AUEBRn
         KrmTPbaxfPbyUTA+qRT6KxtJemdiwpf7vNkggyxg//J61HbJ9zomNnJvSl+/3IremHk8
         PrYA==
X-Gm-Message-State: APjAAAXn/ACDVZmgY7eGA2TkdB73xH4m6sKSscDbZ0zCuw93wU821yd+
        sUm02AXqcxzPxZpXpouG0avtWQ==
X-Google-Smtp-Source: APXvYqyYFbj9++y6OBfemDdW3+kGbXme9jJAPfOYIdIKHQGblyUKP0b9fU/TrwEAONG2Q3LOmQqf7g==
X-Received: by 2002:a0c:eed2:: with SMTP id h18mr5111311qvs.184.1582810117485;
        Thu, 27 Feb 2020 05:28:37 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id v10sm3141066qtj.26.2020.02.27.05.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 05:28:36 -0800 (PST)
Date:   Thu, 27 Feb 2020 08:28:36 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Aman Sharma <amanharitsh123@gmail.com>
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] doc: Convert rculist_nulls.txt to
 rculist_nulls.rst
Message-ID: <20200227132836.GB161459@google.com>
References: <20200227104448.10154-1-amanharitsh123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227104448.10154-1-amanharitsh123@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 27, 2020 at 04:14:46PM +0530, Aman Sharma wrote:
> This patch converts rculist_nulls from .txt to .rst format, and also adds
> it to the index.rst file.

When posting such patches, could you clarify what has changed during the
conversion when you write the commit message?

thanks,

 - Joel


> Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
> ---
>  Documentation/RCU/index.rst         |   1 +
>  Documentation/RCU/rculist_nulls.rst | 179 ++++++++++++++++++++++++++++
>  Documentation/RCU/rculist_nulls.txt | 172 --------------------------
>  3 files changed, 180 insertions(+), 172 deletions(-)
>  create mode 100644 Documentation/RCU/rculist_nulls.rst
>  delete mode 100644 Documentation/RCU/rculist_nulls.txt
> 
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index d60eb4ba2cd0..2cf55bd141b3 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -10,6 +10,7 @@ RCU concepts
>     arrayRCU
>     rcubarrier
>     rcu_dereference
> +   rculist_nulls
>     checklist
>     whatisRCU
>     rcu
> diff --git a/Documentation/RCU/rculist_nulls.rst b/Documentation/RCU/rculist_nulls.rst
> new file mode 100644
> index 000000000000..8e04de44fe3d
> --- /dev/null
> +++ b/Documentation/RCU/rculist_nulls.rst
> @@ -0,0 +1,179 @@
> +.. _rculist_nulls_doc:
> +
> +Using hlist_nulls to protect read-mostly linked lists and objects using SLAB_TYPESAFE_BY_RCU allocations.
> +=========================================================================================================
> +
> +Please read the basics in Documentation/RCU/listRCU.rst
> +
> +Using special makers (called 'nulls') is a convenient way
> +to solve following problem :
> +
> +A typical RCU linked list managing objects which are
> +allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can
> +use following algos :
> +
> +1. Lookup algo
> +--------------
> +::
> +
> +   rcu_read_lock()
> +   begin:
> +   obj = lockless_lookup(key);
> +   if (obj) {
> +   if (!try_get_ref(obj)) // might fail for free objects
> +      goto begin;
> +   /*
> +      * Because a writer could delete object, and a writer could
> +      * reuse these object before the RCU grace period, we
> +      * must check key after getting the reference on object
> +      */
> +   if (obj->key != key) { // not the object we expected
> +      put_ref(obj);
> +      goto begin;
> +      }
> +   }
> +   rcu_read_unlock();
> +
> +Beware that lockless_lookup(key) cannot use traditional hlist_for_each_entry_rcu()
> +but a version with an additional memory barrier (smp_rmb()) ::
> +
> +   lockless_lookup(key)
> +   {
> +      struct hlist_node *node, *next;
> +      for (pos = rcu_dereference((head)->first);
> +            pos && ({ next = pos->next; smp_rmb(); prefetch(next); 1; }) &&
> +            ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> +            pos = rcu_dereference(next))
> +         if (obj->key == key)
> +            return obj;
> +      return NULL;
> +
> +And note the traditional hlist_for_each_entry_rcu() misses this smp_rmb() ::
> +
> +   struct hlist_node *node;
> +   for (pos = rcu_dereference((head)->first);
> +		pos && ({ prefetch(pos->next); 1; }) &&
> +		({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> +		pos = rcu_dereference(pos->next))
> +      if (obj->key == key)
> +         return obj;
> +   return NULL;
> +}
> +
> +Quoting Corey Minyard :
> +
> +"If the object is moved from one list to another list in-between the
> + time the hash is calculated and the next field is accessed, and the
> + object has moved to the end of a new list, the traversal will not
> + complete properly on the list it should have, since the object will
> + be on the end of the new list and there's not a way to tell it's on a
> + new list and restart the list traversal.  I think that this can be
> + solved by pre-fetching the "next" field (with proper barriers) before
> + checking the key."
> +
> +2. Insert algo
> +----------------
> +
> +We need to make sure a reader cannot read the new 'obj->obj_next' value
> +and previous value of 'obj->key'. Or else, an item could be deleted
> +from a chain, and inserted into another chain. If new chain was empty
> +before the move, 'next' pointer is NULL, and lockless reader can
> +not detect it missed following items in original chain ::
> +
> +   /*
> +   * Please note that new inserts are done at the head of list,
> +   * not in the middle or end.
> +   */
> +   obj = kmem_cache_alloc(...);
> +   lock_chain(); // typically a spin_lock()
> +   obj->key = key;
> +   /*
> +   * we need to make sure obj->key is updated before obj->next
> +   * or obj->refcnt
> +   */
> +   smp_wmb();
> +   atomic_set(&obj->refcnt, 1);
> +   hlist_add_head_rcu(&obj->obj_node, list);
> +   unlock_chain(); // typically a spin_unlock()
> +
> +
> +3. Remove algo
> +--------------
> +Nothing special here, we can use a standard RCU hlist deletion.
> +But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be reused
> +very very fast (before the end of RCU grace period) ::
> +
> +   if (put_last_reference_on(obj) {
> +      lock_chain(); // typically a spin_lock()
> +      hlist_del_init_rcu(&obj->obj_node);
> +      unlock_chain(); // typically a spin_unlock()
> +      kmem_cache_free(cachep, obj);
> +   }
> +
> +
> +
> +With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()
> +and extra smp_wmb() in insert function.
> +
> +For example, if we choose to store the slot number as the 'nulls'
> +end-of-list marker for each slot of the hash table, we can detect
> +a race (some writer did a delete and/or a move of an object
> +to another chain) checking the final 'nulls' value if
> +the lookup met the end of chain. If final 'nulls' value
> +is not the slot number, then we must restart the lookup at
> +the beginning. If the object was moved to the same chain,
> +then the reader doesn't care : It might eventually
> +scan the list again without harm.
> +
> +
> +1. lookup algo
> +--------------
> +::
> +
> +   head = &table[slot];
> +   rcu_read_lock();
> +   begin:
> +   hlist_nulls_for_each_entry_rcu(obj, node, head, member) {
> +      if (obj->key == key) {
> +         if (!try_get_ref(obj)) // might fail for free objects
> +            goto begin;
> +         if (obj->key != key) { // not the object we expected
> +            put_ref(obj);
> +            goto begin;
> +         }
> +   goto out;
> +   }
> +   /*
> +   * if the nulls value we got at the end of this lookup is
> +   * not the expected one, we must restart lookup.
> +   * We probably met an item that was moved to another chain.
> +   */
> +   if (get_nulls_value(node) != slot)
> +      goto begin;
> +   obj = NULL;
> +
> +   out:
> +   rcu_read_unlock();
> +
> +2. Insert function
> +------------------
> +
> +::
> +
> +   /*
> +   * Please note that new inserts are done at the head of list,
> +   * not in the middle or end.
> +   */
> +   obj = kmem_cache_alloc(cachep);
> +   lock_chain(); // typically a spin_lock()
> +   obj->key = key;
> +   /*
> +   * changes to obj->key must be visible before refcnt one
> +   */
> +   smp_wmb();
> +   atomic_set(&obj->refcnt, 1);
> +   /*
> +   * insert obj in RCU way (readers might be traversing chain)
> +   */
> +   hlist_nulls_add_head_rcu(&obj->obj_node, list);
> +   unlock_chain(); // typically a spin_unlock()
> diff --git a/Documentation/RCU/rculist_nulls.txt b/Documentation/RCU/rculist_nulls.txt
> deleted file mode 100644
> index 23f115dc87cf..000000000000
> --- a/Documentation/RCU/rculist_nulls.txt
> +++ /dev/null
> @@ -1,172 +0,0 @@
> -Using hlist_nulls to protect read-mostly linked lists and
> -objects using SLAB_TYPESAFE_BY_RCU allocations.
> -
> -Please read the basics in Documentation/RCU/listRCU.rst
> -
> -Using special makers (called 'nulls') is a convenient way
> -to solve following problem :
> -
> -A typical RCU linked list managing objects which are
> -allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can
> -use following algos :
> -
> -1) Lookup algo
> ---------------
> -rcu_read_lock()
> -begin:
> -obj = lockless_lookup(key);
> -if (obj) {
> -  if (!try_get_ref(obj)) // might fail for free objects
> -    goto begin;
> -  /*
> -   * Because a writer could delete object, and a writer could
> -   * reuse these object before the RCU grace period, we
> -   * must check key after getting the reference on object
> -   */
> -  if (obj->key != key) { // not the object we expected
> -     put_ref(obj);
> -     goto begin;
> -   }
> -}
> -rcu_read_unlock();
> -
> -Beware that lockless_lookup(key) cannot use traditional hlist_for_each_entry_rcu()
> -but a version with an additional memory barrier (smp_rmb())
> -
> -lockless_lookup(key)
> -{
> -   struct hlist_node *node, *next;
> -   for (pos = rcu_dereference((head)->first);
> -          pos && ({ next = pos->next; smp_rmb(); prefetch(next); 1; }) &&
> -          ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> -          pos = rcu_dereference(next))
> -      if (obj->key == key)
> -         return obj;
> -   return NULL;
> -
> -And note the traditional hlist_for_each_entry_rcu() misses this smp_rmb() :
> -
> -   struct hlist_node *node;
> -   for (pos = rcu_dereference((head)->first);
> -		pos && ({ prefetch(pos->next); 1; }) &&
> -		({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> -		pos = rcu_dereference(pos->next))
> -      if (obj->key == key)
> -         return obj;
> -   return NULL;
> -}
> -
> -Quoting Corey Minyard :
> -
> -"If the object is moved from one list to another list in-between the
> - time the hash is calculated and the next field is accessed, and the
> - object has moved to the end of a new list, the traversal will not
> - complete properly on the list it should have, since the object will
> - be on the end of the new list and there's not a way to tell it's on a
> - new list and restart the list traversal.  I think that this can be
> - solved by pre-fetching the "next" field (with proper barriers) before
> - checking the key."
> -
> -2) Insert algo :
> -----------------
> -
> -We need to make sure a reader cannot read the new 'obj->obj_next' value
> -and previous value of 'obj->key'. Or else, an item could be deleted
> -from a chain, and inserted into another chain. If new chain was empty
> -before the move, 'next' pointer is NULL, and lockless reader can
> -not detect it missed following items in original chain.
> -
> -/*
> - * Please note that new inserts are done at the head of list,
> - * not in the middle or end.
> - */
> -obj = kmem_cache_alloc(...);
> -lock_chain(); // typically a spin_lock()
> -obj->key = key;
> -/*
> - * we need to make sure obj->key is updated before obj->next
> - * or obj->refcnt
> - */
> -smp_wmb();
> -atomic_set(&obj->refcnt, 1);
> -hlist_add_head_rcu(&obj->obj_node, list);
> -unlock_chain(); // typically a spin_unlock()
> -
> -
> -3) Remove algo
> ---------------
> -Nothing special here, we can use a standard RCU hlist deletion.
> -But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be reused
> -very very fast (before the end of RCU grace period)
> -
> -if (put_last_reference_on(obj) {
> -   lock_chain(); // typically a spin_lock()
> -   hlist_del_init_rcu(&obj->obj_node);
> -   unlock_chain(); // typically a spin_unlock()
> -   kmem_cache_free(cachep, obj);
> -}
> -
> -
> -
> ---------------------------------------------------------------------------
> -With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()
> -and extra smp_wmb() in insert function.
> -
> -For example, if we choose to store the slot number as the 'nulls'
> -end-of-list marker for each slot of the hash table, we can detect
> -a race (some writer did a delete and/or a move of an object
> -to another chain) checking the final 'nulls' value if
> -the lookup met the end of chain. If final 'nulls' value
> -is not the slot number, then we must restart the lookup at
> -the beginning. If the object was moved to the same chain,
> -then the reader doesn't care : It might eventually
> -scan the list again without harm.
> -
> -
> -1) lookup algo
> -
> - head = &table[slot];
> - rcu_read_lock();
> -begin:
> - hlist_nulls_for_each_entry_rcu(obj, node, head, member) {
> -   if (obj->key == key) {
> -      if (!try_get_ref(obj)) // might fail for free objects
> -         goto begin;
> -      if (obj->key != key) { // not the object we expected
> -         put_ref(obj);
> -         goto begin;
> -      }
> -  goto out;
> - }
> -/*
> - * if the nulls value we got at the end of this lookup is
> - * not the expected one, we must restart lookup.
> - * We probably met an item that was moved to another chain.
> - */
> - if (get_nulls_value(node) != slot)
> -   goto begin;
> - obj = NULL;
> -
> -out:
> - rcu_read_unlock();
> -
> -2) Insert function :
> ---------------------
> -
> -/*
> - * Please note that new inserts are done at the head of list,
> - * not in the middle or end.
> - */
> -obj = kmem_cache_alloc(cachep);
> -lock_chain(); // typically a spin_lock()
> -obj->key = key;
> -/*
> - * changes to obj->key must be visible before refcnt one
> - */
> -smp_wmb();
> -atomic_set(&obj->refcnt, 1);
> -/*
> - * insert obj in RCU way (readers might be traversing chain)
> - */
> -hlist_nulls_add_head_rcu(&obj->obj_node, list);
> -unlock_chain(); // typically a spin_unlock()
> -- 
> 2.20.1
> 
