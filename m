Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0347930DE1C
	for <lists+linux-doc@lfdr.de>; Wed,  3 Feb 2021 16:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbhBCP2X (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 Feb 2021 10:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbhBCP2Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Feb 2021 10:28:16 -0500
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [IPv6:2001:1600:4:17::bc0c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54361C061788
        for <linux-doc@vger.kernel.org>; Wed,  3 Feb 2021 07:27:31 -0800 (PST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4DW5CP3rk3zMqLkt;
        Wed,  3 Feb 2021 16:27:29 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4DW5CL70Fxzlh8Tc;
        Wed,  3 Feb 2021 16:27:26 +0100 (CET)
Subject: Re: [PATCH v28 01/12] landlock: Add object management
To:     "Serge E. Hallyn" <serge@hallyn.com>
Cc:     James Morris <jmorris@namei.org>, Jann Horn <jannh@google.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Jeff Dike <jdike@addtoit.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Shuah Khan <shuah@kernel.org>,
        Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
        kernel-hardening@lists.openwall.com, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        linux-security-module@vger.kernel.org, x86@kernel.org,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>
References: <20210202162710.657398-1-mic@digikod.net>
 <20210202162710.657398-2-mic@digikod.net>
 <20210203142128.GA21770@mail.hallyn.com>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <6921cc3e-03b3-4646-e98a-301faade5b9e@digikod.net>
Date:   Wed, 3 Feb 2021 16:27:28 +0100
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <20210203142128.GA21770@mail.hallyn.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 03/02/2021 15:21, Serge E. Hallyn wrote:
> On Tue, Feb 02, 2021 at 05:26:59PM +0100, Micka�l Sala�n wrote:
>> From: Micka�l Sala�n <mic@linux.microsoft.com>
>>
>> A Landlock object enables to identify a kernel object (e.g. an inode).
>> A Landlock rule is a set of access rights allowed on an object.  Rules
>> are grouped in rulesets that may be tied to a set of processes (i.e.
>> subjects) to enforce a scoped access-control (i.e. a domain).
>>
>> Because Landlock's goal is to empower any process (especially
>> unprivileged ones) to sandbox themselves, we cannot rely on a
>> system-wide object identification such as file extended attributes.
>> Indeed, we need innocuous, composable and modular access-controls.
>>
>> The main challenge with these constraints is to identify kernel objects
>> while this identification is useful (i.e. when a security policy makes
>> use of this object).  But this identification data should be freed once
>> no policy is using it.  This ephemeral tagging should not and may not be
>> written in the filesystem.  We then need to manage the lifetime of a
>> rule according to the lifetime of its objects.  To avoid a global lock,
>> this implementation make use of RCU and counters to safely reference
>> objects.
>>
>> A following commit uses this generic object management for inodes.
>>
>> Cc: James Morris <jmorris@namei.org>
>> Cc: Kees Cook <keescook@chromium.org>
>> Cc: Serge E. Hallyn <serge@hallyn.com>
> 
> Acked-by: Serge Hallyn <serge@hallyn.com>
> 
> Just a few suggestions for the description below.
> 
>> Signed-off-by: Micka�l Sala�n <mic@linux.microsoft.com>
>> Reviewed-by: Jann Horn <jannh@google.com>
>> ---
>>
>> Changes since v27:
>> * Update Kconfig for landlock_restrict_self(2).
>> * Cosmetic fixes: use 80 columns in Kconfig and align Makefile
>>   declarations.
>>
>> Changes since v26:
>> * Update Kconfig for landlock_enforce_ruleset_self(2).
>> * Fix spelling.
>>
>> Changes since v24:
>> * Fix typo in comment (spotted by Jann Horn).
>> * Add Reviewed-by: Jann Horn <jannh@google.com>
>>
>> Changes since v23:
>> * Update landlock_create_object() to return error codes instead of NULL.
>>   This help error handling in callers.
>> * When using make oldconfig with a previous configuration already
>>   including the CONFIG_LSM variable, no question is asked to update its
>>   content.  Update the Kconfig help to warn about LSM stacking
>>   configuration.
>> * Constify variable (spotted by Vincent Dagonneau).
>>
>> Changes since v22:
>> * Fix spelling (spotted by Jann Horn).
>>
>> Changes since v21:
>> * Update Kconfig help.
>> * Clean up comments.
>>
>> Changes since v18:
>> * Account objects to kmemcg.
>>
>> Changes since v14:
>> * Simplify the object, rule and ruleset management at the expense of a
>>   less aggressive memory freeing (contributed by Jann Horn, with
>>   additional modifications):
>>   - Remove object->list aggregating the rules tied to an object.
>>   - Remove landlock_get_object(), landlock_drop_object(),
>>     {get,put}_object_cleaner() and landlock_rule_is_disabled().
>>   - Rewrite landlock_put_object() to use a more simple mechanism
>>     (no tricky RCU).
>>   - Replace enum landlock_object_type and landlock_release_object() with
>>     landlock_object_underops->release()
>>   - Adjust unions and Sparse annotations.
>>   Cf. https://lore.kernel.org/lkml/CAG48ez21bEn0wL1bbmTiiu8j9jP5iEWtHOwz4tURUJ+ki0ydYw@mail.gmail.com/
>> * Merge struct landlock_rule into landlock_ruleset_elem to simplify the
>>   rule management.
>> * Constify variables.
>> * Improve kernel documentation.
>> * Cosmetic variable renames.
>> * Remove the "default" in the Kconfig (suggested by Jann Horn).
>> * Only use refcount_inc() through getter helpers.
>> * Update Kconfig description.
>>
>> Changes since v13:
>> * New dedicated implementation, removing the need for eBPF.
>>
>> Previous changes:
>> https://lore.kernel.org/lkml/20190721213116.23476-6-mic@digikod.net/
>> ---
>>  MAINTAINERS                | 10 +++++
>>  security/Kconfig           |  1 +
>>  security/Makefile          |  2 +
>>  security/landlock/Kconfig  | 21 +++++++++
>>  security/landlock/Makefile |  3 ++
>>  security/landlock/object.c | 67 ++++++++++++++++++++++++++++
>>  security/landlock/object.h | 91 ++++++++++++++++++++++++++++++++++++++
>>  7 files changed, 195 insertions(+)
>>  create mode 100644 security/landlock/Kconfig
>>  create mode 100644 security/landlock/Makefile
>>  create mode 100644 security/landlock/object.c
>>  create mode 100644 security/landlock/object.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d3e847f7f3dc..a0e57ade0524 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9936,6 +9936,16 @@ F:	net/core/sock_map.c
>>  F:	net/ipv4/tcp_bpf.c
>>  F:	net/ipv4/udp_bpf.c
>>  
>> +LANDLOCK SECURITY MODULE
>> +M:	Micka�l Sala�n <mic@digikod.net>
>> +L:	linux-security-module@vger.kernel.org
>> +S:	Supported
>> +W:	https://landlock.io
>> +T:	git https://github.com/landlock-lsm/linux.git
>> +F:	security/landlock/
>> +K:	landlock
>> +K:	LANDLOCK
>> +
>>  LANTIQ / INTEL Ethernet drivers
>>  M:	Hauke Mehrtens <hauke@hauke-m.de>
>>  L:	netdev@vger.kernel.org
>> diff --git a/security/Kconfig b/security/Kconfig
>> index 7561f6f99f1d..15a4342b5d01 100644
>> --- a/security/Kconfig
>> +++ b/security/Kconfig
>> @@ -238,6 +238,7 @@ source "security/loadpin/Kconfig"
>>  source "security/yama/Kconfig"
>>  source "security/safesetid/Kconfig"
>>  source "security/lockdown/Kconfig"
>> +source "security/landlock/Kconfig"
>>  
>>  source "security/integrity/Kconfig"
>>  
>> diff --git a/security/Makefile b/security/Makefile
>> index 3baf435de541..47e432900e24 100644
>> --- a/security/Makefile
>> +++ b/security/Makefile
>> @@ -13,6 +13,7 @@ subdir-$(CONFIG_SECURITY_LOADPIN)	+= loadpin
>>  subdir-$(CONFIG_SECURITY_SAFESETID)    += safesetid
>>  subdir-$(CONFIG_SECURITY_LOCKDOWN_LSM)	+= lockdown
>>  subdir-$(CONFIG_BPF_LSM)		+= bpf
>> +subdir-$(CONFIG_SECURITY_LANDLOCK)	+= landlock
>>  
>>  # always enable default capabilities
>>  obj-y					+= commoncap.o
>> @@ -32,6 +33,7 @@ obj-$(CONFIG_SECURITY_SAFESETID)       += safesetid/
>>  obj-$(CONFIG_SECURITY_LOCKDOWN_LSM)	+= lockdown/
>>  obj-$(CONFIG_CGROUPS)			+= device_cgroup.o
>>  obj-$(CONFIG_BPF_LSM)			+= bpf/
>> +obj-$(CONFIG_SECURITY_LANDLOCK)		+= landlock/
>>  
>>  # Object integrity file lists
>>  subdir-$(CONFIG_INTEGRITY)		+= integrity
>> diff --git a/security/landlock/Kconfig b/security/landlock/Kconfig
>> new file mode 100644
>> index 000000000000..79b7d0c3b11e
>> --- /dev/null
>> +++ b/security/landlock/Kconfig
>> @@ -0,0 +1,21 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config SECURITY_LANDLOCK
>> +	bool "Landlock support"
>> +	depends on SECURITY
>> +	select SECURITY_PATH
>> +	help
>> +	  Landlock is a safe sandboxing mechanism that enables processes to
> 
> "safe" probably doesn't need to be there :)
> 
>> +	  restrict themselves (and their future children) by gradually
>> +	  enforcing tailored access control policies.  A security policy is a
> 
> You're redefining "security policy" which could be confusing.  How about
> saying "a landlock security policy is a..."?
> 
>> +	  set of access rights (e.g. open a file in read-only, make a
>> +	  directory, etc.) tied to a file hierarchy.  Such policy can be
>> +	  configured and enforced by any processes for themselves thanks to
> 
> s/thanks to/using the/ ?

OK for these three modifications. Thanks!

> 
>> +	  dedicated system calls: landlock_create_ruleset(),
>> +	  landlock_add_rule(), and landlock_restrict_self().
>> +
>> +	  See Documentation/userspace-api/landlock.rst for further information.
>> +
>> +	  If you are unsure how to answer this question, answer N.  Otherwise,
>> +	  you should also prepend "landlock," to the content of CONFIG_LSM to
>> +	  enable Landlock at boot time.
>> diff --git a/security/landlock/Makefile b/security/landlock/Makefile
>> new file mode 100644
>> index 000000000000..cb6deefbf4c0
>> --- /dev/null
>> +++ b/security/landlock/Makefile
>> @@ -0,0 +1,3 @@
>> +obj-$(CONFIG_SECURITY_LANDLOCK) := landlock.o
>> +
>> +landlock-y := object.o
>> diff --git a/security/landlock/object.c b/security/landlock/object.c
>> new file mode 100644
>> index 000000000000..d674fdf9ff04
>> --- /dev/null
>> +++ b/security/landlock/object.c
>> @@ -0,0 +1,67 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Landlock LSM - Object management
>> + *
>> + * Copyright � 2016-2020 Micka�l Sala�n <mic@digikod.net>
>> + * Copyright � 2018-2020 ANSSI
>> + */
>> +
>> +#include <linux/bug.h>
>> +#include <linux/compiler_types.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/rcupdate.h>
>> +#include <linux/refcount.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include "object.h"
>> +
>> +struct landlock_object *landlock_create_object(
>> +		const struct landlock_object_underops *const underops,
>> +		void *const underobj)
>> +{
>> +	struct landlock_object *new_object;
>> +
>> +	if (WARN_ON_ONCE(!underops || !underobj))
>> +		return ERR_PTR(-ENOENT);
>> +	new_object = kzalloc(sizeof(*new_object), GFP_KERNEL_ACCOUNT);
>> +	if (!new_object)
>> +		return ERR_PTR(-ENOMEM);
>> +	refcount_set(&new_object->usage, 1);
>> +	spin_lock_init(&new_object->lock);
>> +	new_object->underops = underops;
>> +	new_object->underobj = underobj;
>> +	return new_object;
>> +}
>> +
>> +/*
>> + * The caller must own the object (i.e. thanks to object->usage) to safely put
>> + * it.
>> + */
>> +void landlock_put_object(struct landlock_object *const object)
>> +{
>> +	/*
>> +	 * The call to @object->underops->release(object) might sleep, e.g.
>> +	 * because of iput().
>> +	 */
>> +	might_sleep();
>> +	if (!object)
>> +		return;
>> +
>> +	/*
>> +	 * If the @object's refcount cannot drop to zero, we can just decrement
>> +	 * the refcount without holding a lock. Otherwise, the decrement must
>> +	 * happen under @object->lock for synchronization with things like
>> +	 * get_inode_object().
>> +	 */
>> +	if (refcount_dec_and_lock(&object->usage, &object->lock)) {
>> +		__acquire(&object->lock);
>> +		/*
>> +		 * With @object->lock initially held, remove the reference from
>> +		 * @object->underobj to @object (if it still exists).
>> +		 */
>> +		object->underops->release(object);
>> +		kfree_rcu(object, rcu_free);
>> +	}
>> +}
>> diff --git a/security/landlock/object.h b/security/landlock/object.h
>> new file mode 100644
>> index 000000000000..56f17c51df01
>> --- /dev/null
>> +++ b/security/landlock/object.h
>> @@ -0,0 +1,91 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Landlock LSM - Object management
>> + *
>> + * Copyright � 2016-2020 Micka�l Sala�n <mic@digikod.net>
>> + * Copyright � 2018-2020 ANSSI
>> + */
>> +
>> +#ifndef _SECURITY_LANDLOCK_OBJECT_H
>> +#define _SECURITY_LANDLOCK_OBJECT_H
>> +
>> +#include <linux/compiler_types.h>
>> +#include <linux/refcount.h>
>> +#include <linux/spinlock.h>
>> +
>> +struct landlock_object;
>> +
>> +/**
>> + * struct landlock_object_underops - Operations on an underlying object
>> + */
>> +struct landlock_object_underops {
>> +	/**
>> +	 * @release: Releases the underlying object (e.g. iput() for an inode).
>> +	 */
>> +	void (*release)(struct landlock_object *const object)
>> +		__releases(object->lock);
>> +};
>> +
>> +/**
>> + * struct landlock_object - Security blob tied to a kernel object
>> + *
>> + * The goal of this structure is to enable to tie a set of ephemeral access
>> + * rights (pertaining to different domains) to a kernel object (e.g an inode)
>> + * in a safe way.  This implies to handle concurrent use and modification.
>> + *
>> + * The lifetime of a &struct landlock_object depends of the rules referring to
>> + * it.
>> + */
>> +struct landlock_object {
>> +	/**
>> +	 * @usage: This counter is used to tie an object to the rules matching
>> +	 * it or to keep it alive while adding a new rule.  If this counter
>> +	 * reaches zero, this struct must not be modified, but this counter can
>> +	 * still be read from within an RCU read-side critical section.  When
>> +	 * adding a new rule to an object with a usage counter of zero, we must
>> +	 * wait until the pointer to this object is set to NULL (or recycled).
>> +	 */
>> +	refcount_t usage;
>> +	/**
>> +	 * @lock: Guards against concurrent modifications.  This lock must be
>> +	 * held from the time @usage drops to zero until any weak references
>> +	 * from @underobj to this object have been cleaned up.
>> +	 *
>> +	 * Lock ordering: inode->i_lock nests inside this.
>> +	 */
>> +	spinlock_t lock;
>> +	/**
>> +	 * @underobj: Used when cleaning up an object and to mark an object as
>> +	 * tied to its underlying kernel structure.  This pointer is protected
>> +	 * by @lock.  Cf. landlock_release_inodes() and release_inode().
>> +	 */
>> +	void *underobj;
>> +	union {
>> +		/**
>> +		 * @rcu_free: Enables lockless use of @usage, @lock and
>> +		 * @underobj from within an RCU read-side critical section.
>> +		 * @rcu_free and @underops are only used by
>> +		 * landlock_put_object().
>> +		 */
>> +		struct rcu_head rcu_free;
>> +		/**
>> +		 * @underops: Enables landlock_put_object() to release the
>> +		 * underlying object (e.g. inode).
>> +		 */
>> +		const struct landlock_object_underops *underops;
>> +	};
>> +};
>> +
>> +struct landlock_object *landlock_create_object(
>> +		const struct landlock_object_underops *const underops,
>> +		void *const underobj);
>> +
>> +void landlock_put_object(struct landlock_object *const object);
>> +
>> +static inline void landlock_get_object(struct landlock_object *const object)
>> +{
>> +	if (object)
>> +		refcount_inc(&object->usage);
>> +}
>> +
>> +#endif /* _SECURITY_LANDLOCK_OBJECT_H */
>> -- 
>> 2.30.0
