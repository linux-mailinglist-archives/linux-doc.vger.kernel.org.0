Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5767545B4
	for <lists+linux-doc@lfdr.de>; Sat, 15 Jul 2023 02:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjGOAvZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jul 2023 20:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGOAvY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 20:51:24 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970CA11C;
        Fri, 14 Jul 2023 17:51:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6682909acadso1754766b3a.3;
        Fri, 14 Jul 2023 17:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689382283; x=1691974283;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDRscaBv1w0JWMXd2m8J/EKtFh9sNf9PLS46tboQ92A=;
        b=j8s/v0Kv3LmTFcSJegHsV6RbQ5U1JaLdNDn5BcEMk7PEYru2yl2g5d76GBWE4rDnbA
         4ChNQ8gYVfFudkF8QjAbHNQFKXZ8Sagv/PCXj4EM5VJktzGoHQQB4JyzBEFOuSQfoYpP
         VoJY43u3aSH61Vguv0Wvv3s2nHEwEPfiQthzAdH57NLrrJTjZ/9kA81Ex6mBCcs5s66c
         CRCtY8SxbZ3Pj69v54i/VQa1ocs87zdDYhMfY4vhwcr4wbuDRaWaX6JBCwnM+fMen3F4
         s4maxPFpOb5ZVd3tZziw1oN8+QlTxizm5VkSoeiVkGTz9wRaXurqyCHW/VDVobH2tapv
         KNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382283; x=1691974283;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDRscaBv1w0JWMXd2m8J/EKtFh9sNf9PLS46tboQ92A=;
        b=NyYVwRCHfMTn4mDe+zifevC36LNIWbkCdUYhof+mTagkPxrcI4DaWBEkk7hjUwcHrK
         VkYVJkpgejDOQ8S7sHND6RUOrAG2e26urX24l2Ip67MEvDF34TqXnq9i24/V2EEsjmM7
         Bl2o4Hp0XceWcdf1YE6SjAYPxM+7SOdwI79cNVfpIeo6lh7CA4NZyY6XZx6cB7iKlOEC
         yYoPNc4zR7uEq7BGjkGLd5Duw4cswmu+AwMiKBrfecE7QZ6sKO8dC4E11ccARWVpl6LA
         UbnOSgU6q7amRXo0oobCf9pZAFZSxX/CKzekvhsRprbpQ591hBtHpP/te1HbWWFo7Svq
         6/cQ==
X-Gm-Message-State: ABy/qLZ9G+BlqPmVVrPPTqFC3hUSwmwyVzrikS2U5kNgo37+jT//LDYA
        n+gwz5KcEqsmLz+4EgQhKog=
X-Google-Smtp-Source: APBJJlHXsIoACkZfSX/DCI4ZIPzo2xeUjgvBkmnAH0RBWLH4b4W3obEfbvc4jSyufqRTGBGUu0l+ag==
X-Received: by 2002:a05:6a00:3a1d:b0:680:f6fe:8908 with SMTP id fj29-20020a056a003a1d00b00680f6fe8908mr5573122pfb.9.1689382283020;
        Fri, 14 Jul 2023 17:51:23 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:2:a2a::1])
        by smtp.gmail.com with ESMTPSA id v15-20020a62a50f000000b00640dbbd7830sm7951128pfm.18.2023.07.14.17.51.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2023 17:51:22 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2] docs/RCU: Bring back smp_wmb()
From:   Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <9eaf506f-cc14-4da6-9efc-057c0c3e56b0@paulmck-laptop>
Date:   Sat, 15 Jul 2023 08:50:23 +0800
Cc:     Frederic Weisbecker <frederic@kernel.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Boqun Feng <boqun.feng@gmail.com>, corbet@lwn.net,
        rcu@vger.kernel.org, linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D42CEB7-FE22-4BC6-9E5C-8131579C129D@gmail.com>
References: <20230711150906.466434-1-mmpgouride@gmail.com>
 <9eaf506f-cc14-4da6-9efc-057c0c3e56b0@paulmck-laptop>
To:     paulmck@kernel.org
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> 2023=E5=B9=B47=E6=9C=8815=E6=97=A5 07:23=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Jul 11, 2023 at 03:09:06PM +0000, Alan Huang wrote:
>> The objects are allocated with SLAB_TYPESAFE_BY_RCU, and there is
>> n->next =3D first within hlist_add_head_rcu() before =
rcu_assign_pointer(),
>> which modifies obj->obj_node.next. There may be readers holding the
>> reference of obj in lockless_lookup, and when updater modifies =
->next,
>> readers can see the change immediately because =
ofSLAB_TYPESAFE_BY_RCU.
>>=20
>> There are two memory ordering required in the insertion algorithm,
>> we need to make sure obj->key is updated before obj->obj_node.next
>> and obj->refcnt, atomic_set_release is not enough to provide the
>> required memory barrier.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>=20
> This is an interesting one!!!
>=20
> Now I am having a hard time believing that the smp_rmb() suffices.
>=20
>> ---
>> Changelog:
>>  v1 -> v2: Use _ONCE to protect obj->key.
>>=20
>> Documentation/RCU/rculist_nulls.rst | 21 +++++++++++++--------
>> 1 file changed, 13 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/Documentation/RCU/rculist_nulls.rst =
b/Documentation/RCU/rculist_nulls.rst
>> index 21e40fcc08de..2a9f5a63d334 100644
>> --- a/Documentation/RCU/rculist_nulls.rst
>> +++ b/Documentation/RCU/rculist_nulls.rst
>> @@ -47,7 +47,7 @@ objects, which is having below type.
>>     * reuse these object before the RCU grace period, we
>>     * must check key after getting the reference on object
>>     */
>> -    if (obj->key !=3D key) { // not the object we expected
>> +    if (READ_ONCE(obj->key) !=3D key) { // not the object we =
expected
>>       put_ref(obj);
>>       rcu_read_unlock();
>>       goto begin;
>> @@ -64,10 +64,10 @@ but a version with an additional memory barrier =
(smp_rmb())
>>   {
>>     struct hlist_node *node, *next;
>>     for (pos =3D rcu_dereference((head)->first);
>> -         pos && ({ next =3D pos->next; smp_rmb(); prefetch(next); 1; =
}) &&
>> +         pos && ({ next =3D READ_ONCE(pos->next); smp_rmb(); =
prefetch(next); 1; }) &&
>=20
> Suppose that lockless_lookup() is delayed just before fetching =
pos->next,
> and that there were 17 more node to search in the list.
>=20
> Then consider the following sequence of events:
>=20
> o The updater deletes this same node and kmem_cache_free()s it.
>=20
> o Another updater kmem_cache_alloc()s that same memory and
> inserts it into an empty hash chain with a different key.
>=20
> o Then lockless_lookup() fetches pos->next and sees a NULL pointer,
> thus failing to search the remaining 17 nodes in the list,
> one of which had the desired key value.
>=20
> o The lookup algorithm resumes and sees the NULL return from
> lockless_lookup(), and ends up with a NULL obj.
>=20
> And this happens even with the strongest possible ordering
> everywhere.
>=20
> OK, yes, it is late on Friday.  So what am I missing here?

You missed nothing!

The lockless_lockup should not be a function, but a macro like =
hlist_for_each_entry_rcu.

>=20
> Independent of that, does hlist_add_head_rcu() need to replace its
> "n->next =3D first" with "WRITE_ONCE(n->next, first)"?

I think users who want to use hlist with SLAB_TYPESAFE_BY_RCU should use =
rculist_nulls?

I didn=E2=80=99t find a case using hlist with SLAB_TYPESAFE_BY_RCU, but =
I did find a case using list
with SLAB_TYPESAFE_BY_RCU in drivers/gpu/drm/i915, the driver also =
doesn=E2=80=99t use _ONCE
on the fields of the objects allocated with SLAB_TYPESAFE_BY_RCU.

>=20
> Thanx, Paul
>=20
>>          ({ obj =3D hlist_entry(pos, typeof(*obj), obj_node); 1; });
>>          pos =3D rcu_dereference(next))
>> -      if (obj->key =3D=3D key)
>> +      if (READ_ONCE(obj->key) =3D=3D key)
>>         return obj;
>>     return NULL;
>>   }
>> @@ -111,8 +111,13 @@ detect the fact that it missed following items =
in original chain.
>>    */
>>   obj =3D kmem_cache_alloc(...);
>>   lock_chain(); // typically a spin_lock()
>> -  obj->key =3D key;
>> -  atomic_set_release(&obj->refcnt, 1); // key before refcnt
>> +  WRITE_ONCE(obj->key, key);
>> +  /*
>> +   * We need to make sure obj->key is updated before =
obj->obj_node.next
>> +   * and obj->refcnt.
>> +   */
>> +  smp_wmb();
>> +  atomic_set(&obj->refcnt, 1);
>>   hlist_add_head_rcu(&obj->obj_node, list);
>>   unlock_chain(); // typically a spin_unlock()
>>=20
>> @@ -165,12 +170,12 @@ Note that using hlist_nulls means the type of =
'obj_node' field of
>>   begin:
>>   rcu_read_lock();
>>   hlist_nulls_for_each_entry_rcu(obj, node, head, obj_node) {
>> -    if (obj->key =3D=3D key) {
>> +    if (READ_ONCE(obj->key) =3D=3D key) {
>>       if (!try_get_ref(obj)) { // might fail for free objects
>> rcu_read_unlock();
>>         goto begin;
>>       }
>> -      if (obj->key !=3D key) { // not the object we expected
>> +      if (READ_ONCE(obj->key) !=3D key) { // not the object we =
expected
>>         put_ref(obj);
>> rcu_read_unlock();
>>         goto begin;
>> @@ -206,7 +211,7 @@ hlist_add_head_rcu().
>>    */
>>   obj =3D kmem_cache_alloc(cachep);
>>   lock_chain(); // typically a spin_lock()
>> -  obj->key =3D key;
>> +  WRITE_ONCE(obj->key, key);
>>   atomic_set_release(&obj->refcnt, 1); // key before refcnt
>>   /*
>>    * insert obj in RCU way (readers might be traversing chain)
>> --=20
>> 2.34.1


