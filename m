Return-Path: <linux-doc+bounces-21300-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B493B79F
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 21:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2C21F23CDB
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 19:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FB115F3EF;
	Wed, 24 Jul 2024 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hccTp/14"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599A952F6F
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 19:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721849805; cv=none; b=mkbrWVRu3EkMd441+kFyaPWwZsio7h9pl7O+tEZFgBGo7oNkH5YOQiXYXFz++AEyYNpQi7E1eUI9IWBuOMLJU2rVM5GQzdDLnVwv6E8NnNb8luLN9MzwXOzQWpDeXKyPRU5cuujqqyEHdvkcFJD4CNthJ47bE7VcZCFuvUlf7sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721849805; c=relaxed/simple;
	bh=G65BQ8ZETSnWP5F7kWFRz1hJIoEwZ48ofdPadlg5AdM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+iZo9GfU/z0zdqF7rfwVzxx3iNBBVLmyDIV9iFapHkGku6+2GF3E4SYGC4u6HsiSVlfkXwGH79iFc+2pGw5GDrqhpZ7FU7Cn/82oXUrjP4C2yeMcPz84R4cMk9pd53z+0jWDAPZxXCY5pVmGXocpBHTCIhBG/sF5Y3gtVQGrP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hccTp/14; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721849796; x=1722108996;
	bh=Ex+yutQkGp2wbHRJ1q0Nvfaduezw0qpsrEkXrC2Hz2U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hccTp/14FsvEzv57iz5I7FOaS8KpfbobNd3BGo7ySqOJ7hKXTcDw7xQUiuQqQgy1Y
	 I9JGME8jJOdL7De84zZJfXpQvm60n5bpGQComZ3fR5YM8OgIMtoO7eLZ0iqHDgenfA
	 0l/ZvwXSL+vjs0ZYuLanTzhedI6N3Sj0R2VFZ0UZO4+yZALwIg3xyt9631VzFEbLKP
	 Ij5SnoHjva8jBbdA1LOXrO2GL7Gy0DCOOnu443uHW938XdyqL0CxOJGT/++2Utw4Nj
	 VjECOVyWlCj9y+3itmnFeZODyVdRhygmSLAjfotdPYD5hP3TmoaY/It7A2X+vHJ+xK
	 GMq8HwEv1gTKg==
Date: Wed, 24 Jul 2024 19:36:29 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 1/5] doc: rust: create safety standard
Message-ID: <4ed475d3-37b6-49e7-8b43-df3160f4ebbc@proton.me>
In-Reply-To: <CAH5fLgg0O=t2T2MQH2hvm4eZnCOa_NffzRw=XZPi9+7+=XsmRg@mail.gmail.com>
References: <20240717221133.459589-1-benno.lossin@proton.me> <20240717221133.459589-2-benno.lossin@proton.me> <CAH5fLgg0O=t2T2MQH2hvm4eZnCOa_NffzRw=XZPi9+7+=XsmRg@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 06ca8bbf045bb4f4659d593a55d9d1f164b44cc2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.07.24 14:20, Alice Ryhl wrote:
> On Thu, Jul 18, 2024 at 12:12=E2=80=AFAM Benno Lossin <benno.lossin@proto=
n.me> wrote:
>> +Soundness
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +``unsafe`` operations (e.g. ``unsafe`` functions, dereferencing raw poi=
nters etc.) have certain
>> +conditions that need to be fulfilled in order for the operation to not =
be UB.
>> +To evaluate if the ``unsafe`` code usage is correct, one needs to consi=
der the API that wraps said
>> +``unsafe`` code. If under all possible safe uses of the API, the condit=
ions for the ``unsafe``
>> +operation are fulfilled, the API is *sound*. Otherwise it is *unsound*.=
 Here is a simple example::
>> +
>> +    pub struct Data {
>> +        a: usize,
>> +    }
>> +
>> +    pub fn access_a(data: *mut Data) -> usize {
>> +        unsafe { (*data).a }
>> +    }
>> +
>> +    fn main() {
>> +        let mut d =3D Data { a: 42 };
>> +        println!("{}", access_a(&mut d));
>> +    }
>> +
>> +While this example has no UB, the function ``access_a`` is unsound. Thi=
s is because one could just
>> +write the following safe usage::
>> +
>> +    println!("{}", access_a(core::ptr::null_mut()));
>> +
>> +And this would result in a dereference of a null pointer.
>> +
>> +In its essence, a sound API means that if someone only writes safe code=
, they can never encounter UB
>> +even if they call safe code that calls ``unsafe`` code behind the scene=
s.
>=20
> I think this section on soundness could be more clear. You never
> really give a definition for what soundness is; you just jump into an
> example immediately.

I would argue that the sentence "If under all possible safe uses of the
API, the conditions for the ``unsafe`` operation are fulfilled, the API
is *sound*. Otherwise it is *unsound*." is a definition. Is this lacking
anything, or do you have an idea to improve the wording?
I am not really understanding what kind of additional definition you
would like to see.

> It may be nice to talk about how a sound API must prevent memory
> safety issues, even if the safe code required to do so is silly or
> unrealistic. Doing so is necessary to maintain the "safe code never
> has memory safety bugs" guarantee.

That is a good way to phrase things, I will add that.

>> +Because unsoundness issues have the potential for allowing safe code to=
 experience UB, they are
>> +treated similarly to actual bugs with UB. Their fixes should also be in=
cluded in the  stable tree.
>> +
>> +Safety Documentation
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +After trying to minimize and remove as much ``unsafe`` code as possible=
, there still is some left.
>> +This is because some things are just not possible in only safe code. Th=
is last part of ``unsafe``
>> +code must still be correct. Helping with that is the safety documentati=
on: it meticulously documents
>> +the various requirements and justifications for every line of ``unsafe`=
` code. That way it can be
>> +ensured that all ``unsafe`` code is sound without anyone needing to kno=
w the whole kernel at once.
>> +The gist of the idea is this: every ``unsafe`` operation documents its =
requirements and every
>> +location that uses an ``unsafe`` operation documents for every requirem=
ent a justification why they
>> +are fulfilled. If now all requirements and justifications are correct, =
then there can only be sound
>> +``unsafe`` code.
>> +
>> +The ``unsafe`` keywords has two different meanings depending on the con=
text it is used in:
>> +
>> +* granting access to an unchecked operation,
>> +* declaring that something is an unchecked operation.
>> +
>> +In both cases we have to add safety documentation. In the first case, w=
e have to justify why we can
>> +always guarantee that the requirements of the unchecked operation are f=
ulfilled. In the second case,
>> +we have to list the requirements that have to be fulfilled for the oper=
ation to be sound.
>> +
>> +In the following sections we will go over each location where ``unsafe`=
` can be used.
>> +
>> +.. _unsafe-Functions:
>> +
>> +``unsafe`` Functions
>> +--------------------
>> +
>> +``unsafe`` on function declarations is used to state that this function=
 has special requirements
>> +that callers have to ensure when calling the function::
>> +
>> +    unsafe fn foo() {
>> +        // ...
>> +    }
>> +
>> +These requirements are called the safety requirements of the function. =
These requirements can take
>> +any shape and range from simple requirements like "``ptr_arg`` is valid=
" (``ptr_arg`` refers to some
>> +argument with the type matching ``*mut T`` or ``*const T``) to more com=
plex requirements like
>> +"``ptr`` must be valid, point to a ``NUL``-terminated C string, and it =
must be valid for at least
>> +``'a``. While the returned value is alive, the memory at ``ptr`` must n=
ot be mutated.".
>> +
>> +The safety requirements have to be documented in the so called safety s=
ection::
>> +
>> +    /// <oneline description of the function>
>> +    ///
>> +    /// <full description of the function>
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// <safety requirements>
>> +    unsafe fn foo() {
>> +        // ...
>> +    }
>=20
> I would love to see a proper example here.

Depending on how the discussion goes with this series, I plan to go
through the tree and try to improve the safety comments. That way I will
have a good source for examples, since otherwise they are extremely hard
to come up with.
(I am also open to any suggestions :)

>> +.. _unsafe-Blocks:
>> +
>> +``unsafe`` Blocks
>> +-----------------
>> +
>> +``unsafe`` code blocks are used to call ``unsafe`` functions and perfor=
m built-in ``unsafe``
>> +operations such as dereferencing a raw pointer::
>> +
>> +    unsafe { foo() };
>> +
>> +In order to ensure that all safety requirements of ``unsafe`` operation=
s are upheld, a safety
>> +comment is mandatory for all ``unsafe`` blocks. This safety comment nee=
ds to provide a correct
>> +justification for every safety requirements of every operation within t=
he block::
>> +
>> +    // SAFETY: <justifications>
>> +    unsafe { foo() };
>=20
> I think it is worth explicitly pointing out that the safety comment
> must explain why the preconditions are satisfied, *not* what the
> preconditions are. It's a really really common mistake to mix up
> these, and it probably even makes sense to include two examples
> showing the difference.

Good idea, but I will put that into justifications.rst.

>> +For transparency it is best practice to have only a single ``unsafe`` o=
peration per ``unsafe``
>> +block, since then it is more clear what the justifications are trying t=
o justify. Safe operations
>> +should not be included in the block, since it adds confusion as to whic=
h operation is the ``unsafe``
>> +one. In certain cases however it makes it easier to understand if there=
 is only a single ``unsafe``
>> +block. For example::
>> +
>> +    // SAFETY: `ptr` is valid for writes.
>> +    unsafe {
>> +        (*ptr).field1 =3D 42;
>> +        (*ptr).field2 =3D 24;
>> +        (*ptr).field3 =3D 2442;
>> +    }
>> +
>> +In this case it is more readable to not split the block into multiple p=
arts.
>=20
> It would be nice with an example of a completely normal safety comment
> example. Also would be nice to call out that the semicolon goes
> outside the unsafe block to improve formatting, when it's a single
> operation.

Will add.

> It would also be nice with an example that shows how to reference the
> safety requirements of the current function. (That is, an example that
> combines unsafe fn with unsafe block.)

See above.

---
Cheers,
Benno


