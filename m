Return-Path: <linux-doc+bounces-21065-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A148937AE5
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 18:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAE95B2341A
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 16:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E2A2AF12;
	Fri, 19 Jul 2024 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3bkB/Dfl"
X-Original-To: linux-doc@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F5A22331;
	Fri, 19 Jul 2024 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721406274; cv=none; b=npX/tRxG8kabkt5IxSWwfsx/S5/eq+HLun9O4dLZeA71c7O/FicO+l+PPeWnEUHSqfczlNoubU82Ad/UmHOxQX4UH4n2ElR35GLuOPyPxNS6X+4uWrfn1++zE1JxHHlsxjhdtFLMuhkafigIgcijSNaRj9hprBukMKuiAMIPM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721406274; c=relaxed/simple;
	bh=FcSr1TgcEitI1TYZehyv0Ew6mstsPtwktnR+RpvKb7Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IuqedY3x8VtP/+ipgwJjeeTpE2I05wNPFtwcoAVoRjuUkoZpQX+1/2XzjBf7vT5tgCZIT17zCz0wOr608kt+ptNSlBqdCO8X8KrnG1mCneVYfckkPWVGdXe1YC42E8aa6anl34lf693fUHTNjekPscChvOLAR5736vN9GFY6JEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3bkB/Dfl; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721406269;
	bh=FcSr1TgcEitI1TYZehyv0Ew6mstsPtwktnR+RpvKb7Y=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=3bkB/Dflg3/cKipfhJ7HkDO3nBMnBnXHFtLV9RJQAnweeozgcXyplrkhx4sjfxdxO
	 tm6282EsHc9SvQm4JS1xfV8SLij95eKg3YJJz3guVXGfpBElxzkW0pVddP+35RYPFs
	 8FifM+lVVKPq6B2UWEkUgxKQX9GMu1QLlTwibw7+YQRjnGJzrs4skU9LcEaw0eO9Y0
	 p3bvQtMoCp5Jec31fKikA22efboe4uAyaCO+E5Upg9mHkJL4ewmBT+sWYxrhrJyNUl
	 GSZXR5X9peGXIY93zxwE5/JbM+n1odwOjbYfJV3fmvlQZ6NcYzkgwv5uW+UQ/CQkcj
	 UTBe7p3GYDsuA==
Received: from smtpclient.apple (cola.collaboradmins.com [IPv6:2a01:4f8:1c1c:5717::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E38B537813D3;
	Fri, 19 Jul 2024 16:24:23 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH 1/5] doc: rust: create safety standard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240717221133.459589-2-benno.lossin@proton.me>
Date: Fri, 19 Jul 2024 13:24:10 -0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <99DF6A0F-BAE9-4341-8B42-6C1F1C69E2C6@collabora.com>
References: <20240717221133.459589-1-benno.lossin@proton.me>
 <20240717221133.459589-2-benno.lossin@proton.me>
To: Benno Lossin <benno.lossin@proton.me>
X-Mailer: Apple Mail (2.3774.600.62)

Hi Benno,

It=E2=80=99s nice to see this shaping up. I do agree that it=E2=80=99s a =
bit of a wild
west right now.

IMHO, we need a lint to enforce compliance, unless we plan to have every =
patch
reviewed by the RFL community, which is unrealistic as time goes =
forward. I
myself have forgotten to properly document unsafe blocks because it=E2=80=99=
s easy
to miss things when submitting more than a thousand LOC.

A new clippy lint would make sense here, since we already have clippy =
support
in the kernel anyways.

> On 17 Jul 2024, at 19:12, Benno Lossin <benno.lossin@proton.me> wrote:
>=20
> `unsafe` Rust code in the kernel is required to have safety
> documentation. This is to ensure the correctness of `unsafe` code and =
is
> thus very important.
> However, at this point in time there does not exist a standard way of
> writing safety documentation. This leads to confusion, as authors
> struggle to find the right way to convey their desired intentions.
> Readers struggle with correctly interpreting the existing =
documentation.
>=20
> Add the safety standard that will document the meaning of safety
> documentation. This first document gives an overview of the problem =
and
> gives general information about the topic.
>=20
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
> Documentation/rust/general-information.rst   |   1 +
> Documentation/rust/index.rst                 |   1 +
> Documentation/rust/safety-standard/index.rst | 246 +++++++++++++++++++
> 3 files changed, 248 insertions(+)
> create mode 100644 Documentation/rust/safety-standard/index.rst
>=20
> diff --git a/Documentation/rust/general-information.rst =
b/Documentation/rust/general-information.rst
> index e3f388ef4ee4..ddfe4e2e5307 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -54,6 +54,7 @@ the same invocation used for compilation, e.g.::
> Please note that Clippy may change code generation, thus it should not =
be
> enabled while building a production kernel.
>=20
> +.. _rust-abstractions:
>=20
> Abstractions vs. bindings
> -------------------------
> diff --git a/Documentation/rust/index.rst =
b/Documentation/rust/index.rst
> index 46d35bd395cf..968e9aace301 100644
> --- a/Documentation/rust/index.rst
> +++ b/Documentation/rust/index.rst
> @@ -39,6 +39,7 @@ configurations.
>     quick-start
>     general-information
>     coding-guidelines
> +    safety-standard/index
>     arch-support
>     testing
>=20
> diff --git a/Documentation/rust/safety-standard/index.rst =
b/Documentation/rust/safety-standard/index.rst
> new file mode 100644
> index 000000000000..1cbc8d3dea04
> --- /dev/null
> +++ b/Documentation/rust/safety-standard/index.rst
> @@ -0,0 +1,246 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. highlight:: rust
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Rust Safety Standard
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Safe Rust code cannot have memory related bugs. This is a guarantee =
by the Rust compiler. Of course
> +it is not without caveats: no compiler bugs, no bugs in the =
specification etc. But the possibly most
> +important caveat is that of ``unsafe`` code. ``unsafe`` code needs to =
follow certain rules in order
> +for safe code to enjoy the no-memory-bugs privilege. A simple example =
of such a rule is that
> +references must be valid for the duration of their lifetime. If any =
rule is violated, it can lead
> +to undefined behavior even in safe code! The term undefined behavior =
in Rust has a lot stricter
> +meaning than in C or C++: UB in Rust is totally forbidden. In C one =
might rely on the compiler
> +implementation to ensure correct code generation, but that is not the =
case for Rust. You can read
> +more about UB in Rust
> +`here =
<https://doc.rust-lang.org/reference/behavior-considered-undefined.html>`_=
.
> +
> +If ``unsafe`` code makes our life this difficult, one might ask the =
question "why do we even need
> +it?" and the answer to that is that it gives users an escape hatch to =
do things that the compiler
> +normally forbids. ``unsafe`` code is a tool that enables programmers =
to write more performant code,
> +or code that interacts with hardware or C. These things are =
particularly important in kernel
> +development.
> +
> +The most effective way to prevent issues in ``unsafe`` code is to =
just not write ``unsafe`` code in
> +the first place. That is why minimizing the amount of ``unsafe`` code =
is very important. For
> +example, drivers are not allowed to directly interface with the C =
side. Instead of directly
> +communicating with C functions, they interact with Rust abstractions. =
This concentrates the usage
> +of ``unsafe`` code, making it easy to fix issues, since only the =
abstraction needs to be fixed.
> +Abstractions also allow taking advantage of other Rust language =
features. Read more in
> +:ref:`rust-abstractions`.

This is something that I think we should discuss at Kangrejos. I do not =
think
that we should set in stone that the kernel crate is the only place =
where
unsafe code is acceptable.

I am in no way disagreeing with the use of safe abstractions, but I =
think we
should have abstractions where they make sense. This is the case in the =
vast
majority of times, but not in *all* of them.

A simple example is a MMIO read or write. Should a driver be forbidden =
to call
readX/writeX for an address it knows to be valid? How can you possibly =
write an
abstraction for this, when the driver is the only one aware of the =
actual
device addresses, and when the driver author is the person with actual =
access
to the HW docs?

If a driver is written partially in Rust, and partially in C, and it =
gets a
pointer to some kcalloc=E2=80=99d memory in C, should It be forbidden to =
use unsafe
in order to build a slice from that pointer? How can you possibly design =
a
general abstraction for something that is, essentially, a =
driver-internal API?

For these corner cases, a simple safety comment should suffice. By all =
means,
let's strive to push as much of the unsafe bits into the kernel crate. =
But,
IMHO, we shouldn=E2=80=99t treat Rust drivers as some unprivileged =
entity, they=E2=80=99re
also kernel code, after all.

> +
> +Since the correctness of the abstractions is integral for safe code =
to also be correct, extra effort
> +is expended to get them right. Part of that is good safety =
documentation.
> +
> +The goals of safety documentation are:
> +
> +* reduce the amount of bugs in ``unsafe`` code,
> +* help readers know why a given piece of ``unsafe`` code is sound,
> +* help writers write ``unsafe`` code with confidence,
> +* simplify the work of reviewers.
> +
> +This document standardizes safety documentation. The necessity for =
this is simple, only a common
> +language that all parties understand is effective at the above task. =
We want to avoid
> +misunderstandings in safety related matters. An additional benefit is =
that programmers will not have
> +to ponder for the correct phrasing, since they can find it here.
> +
> +This document assumes that the reader is familiar with Rust code and =
understands the most important
> +concepts of ``unsafe`` Rust. It is recommended that the reader has =
read the `Rust Book`_. Since this
> +document is about safety documentation, almost all examples are going =
to contain ``unsafe`` code.
> +For this reason it is also recommended to read the `Rustonomicon`_, =
one of the best resources on
> +``unsafe`` code.
> +
> +.. _Rustonomicon: https://doc.rust-lang.org/nomicon/index.html
> +.. _Rust Book: https://doc.rust-lang.org/stable/book/
> +
> +If you need help coming up with an abstraction, or with writing the =
safety documentation for an
> +abstraction, feel free to reach out on `zulip`_ or the `list`_.
> +
> +.. _zulip: https://rust-for-linux.zulipchat.com
> +.. _list: https://lore.kernel.org/rust-for-linux
> +
> +Soundness
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``unsafe`` operations (e.g. ``unsafe`` functions, dereferencing raw =
pointers etc.) have certain
> +conditions that need to be fulfilled in order for the operation to =
not be UB.
> +To evaluate if the ``unsafe`` code usage is correct, one needs to =
consider the API that wraps said
> +``unsafe`` code. If under all possible safe uses of the API, the =
conditions for the ``unsafe``
> +operation are fulfilled, the API is *sound*. Otherwise it is =
*unsound*. Here is a simple example::
> +
> +    pub struct Data {
> +        a: usize,
> +    }
> +
> +    pub fn access_a(data: *mut Data) -> usize {
> +        unsafe { (*data).a }
> +    }
> +
> +    fn main() {
> +        let mut d =3D Data { a: 42 };
> +        println!("{}", access_a(&mut d));
> +    }
> +
> +While this example has no UB, the function ``access_a`` is unsound. =
This is because one could just
> +write the following safe usage::
> +
> +    println!("{}", access_a(core::ptr::null_mut()));
> +
> +And this would result in a dereference of a null pointer.
> +
> +In its essence, a sound API means that if someone only writes safe =
code, they can never encounter UB
> +even if they call safe code that calls ``unsafe`` code behind the =
scenes.
> +
> +Because unsoundness issues have the potential for allowing safe code =
to experience UB, they are
> +treated similarly to actual bugs with UB. Their fixes should also be =
included in the  stable tree.
> +
> +Safety Documentation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +After trying to minimize and remove as much ``unsafe`` code as =
possible, there still is some left.
> +This is because some things are just not possible in only safe code. =
This last part of ``unsafe``
> +code must still be correct. Helping with that is the safety =
documentation: it meticulously documents
> +the various requirements and justifications for every line of =
``unsafe`` code. That way it can be
> +ensured that all ``unsafe`` code is sound without anyone needing to =
know the whole kernel at once.
> +The gist of the idea is this: every ``unsafe`` operation documents =
its requirements and every
> +location that uses an ``unsafe`` operation documents for every =
requirement a justification why they
> +are fulfilled. If now all requirements and justifications are =
correct, then there can only be sound
> +``unsafe`` code.
> +
> +The ``unsafe`` keywords has two different meanings depending on the =
context it is used in:
> +
> +* granting access to an unchecked operation,
> +* declaring that something is an unchecked operation.
> +
> +In both cases we have to add safety documentation. In the first case, =
we have to justify why we can
> +always guarantee that the requirements of the unchecked operation are =
fulfilled. In the second case,
> +we have to list the requirements that have to be fulfilled for the =
operation to be sound.
> +
> +In the following sections we will go over each location where =
``unsafe`` can be used.
> +
> +.. _unsafe-Functions:
> +
> +``unsafe`` Functions
> +--------------------
> +
> +``unsafe`` on function declarations is used to state that this =
function has special requirements
> +that callers have to ensure when calling the function::
> +
> +    unsafe fn foo() {
> +        // ...
> +    }
> +
> +These requirements are called the safety requirements of the =
function. These requirements can take
> +any shape and range from simple requirements like "``ptr_arg`` is =
valid" (``ptr_arg`` refers to some
> +argument with the type matching ``*mut T`` or ``*const T``) to more =
complex requirements like
> +"``ptr`` must be valid, point to a ``NUL``-terminated C string, and =
it must be valid for at least
> +``'a``. While the returned value is alive, the memory at ``ptr`` must =
not be mutated.".
> +
> +The safety requirements have to be documented in the so called safety =
section::
> +
> +    /// <oneline description of the function>
> +    ///
> +    /// <full description of the function>
> +    ///
> +    /// # Safety
> +    ///
> +    /// <safety requirements>
> +    unsafe fn foo() {
> +        // ...
> +    }
> +
> +.. _unsafe-Blocks:
> +
> +``unsafe`` Blocks
> +-----------------
> +
> +``unsafe`` code blocks are used to call ``unsafe`` functions and =
perform built-in ``unsafe``
> +operations such as dereferencing a raw pointer::
> +
> +    unsafe { foo() };
> +
> +In order to ensure that all safety requirements of ``unsafe`` =
operations are upheld, a safety
> +comment is mandatory for all ``unsafe`` blocks. This safety comment =
needs to provide a correct
> +justification for every safety requirements of every operation within =
the block::
> +
> +    // SAFETY: <justifications>
> +    unsafe { foo() };
> +
> +For transparency it is best practice to have only a single ``unsafe`` =
operation per ``unsafe``
> +block, since then it is more clear what the justifications are trying =
to justify. Safe operations
> +should not be included in the block, since it adds confusion as to =
which operation is the ``unsafe``
> +one. In certain cases however it makes it easier to understand if =
there is only a single ``unsafe``
> +block. For example::
> +
> +    // SAFETY: `ptr` is valid for writes.
> +    unsafe {
> +        (*ptr).field1 =3D 42;
> +        (*ptr).field2 =3D 24;
> +        (*ptr).field3 =3D 2442;
> +    }
> +
> +In this case it is more readable to not split the block into multiple =
parts.
> +
> +``unsafe`` Traits
> +-----------------
> +
> +When ``unsafe`` is on a ``trait`` declaration::
> +
> +    unsafe trait Foo {}
> +
> +The ``trait`` has special requirements for implementing it. Similar =
to :ref:`unsafe-Functions`, these
> +are called safety requirements and need to be documented in the same =
way::
> +
> +    /// <oneline description of the trait>
> +    ///
> +    /// <full description of the trait>
> +    ///
> +    /// # Safety
> +    ///
> +    /// <safety requirements>
> +    unsafe trait Foo {}
> +
> +``unsafe`` Impls
> +----------------
> +
> +When ``unsafe`` is on an ``impl`` item::
> +
> +    unsafe impl Foo for Bar {}
> +
> +The ``Foo`` ``trait`` has to be ``unsafe`` and its safety =
requirements need to be justified
> +similarly to :ref:`unsafe-Blocks`::
> +
> +    // SAFETY: <justification>
> +    unsafe impl Foo for Bar {}
> +
> +General Rules
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The general thought behind all rules in the safety standard is that =
everything that cannot be
> +statically checked by the Rust compiler and guaranteed, needs to be =
either checked at runtime, or
> +have to have safety documentation.
> +
> +The Kernel uses ``deny(unsafe_op_in_unsafe_fn)``, disallowing =
``unsafe`` operations to be contained
> +in ``unsafe`` functions without a surrounding ``unsafe`` block, an =
example violating that would be::
> +
> +    unsafe fn zero_ptr(ptr: *mut u32) {
> +        *ptr =3D 0;
> +    }
> +
> +Denying code like this is becoming the default in modern editions of =
the Rust language. It is also
> +easy to see why we would want to deny such code: where would we put =
the ``SAFETY`` comment for the
> +pointer dereference?
> +
> +Further Pages
> +-------------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --=20
> 2.45.1
>=20
>=20


=E2=80=94 Daniel


