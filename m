Return-Path: <linux-doc+bounces-13042-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D75ED890F6F
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 01:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 064491C26A6A
	for <lists+linux-doc@lfdr.de>; Fri, 29 Mar 2024 00:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503433B796;
	Fri, 29 Mar 2024 00:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="Ud4fUuRZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEC13BB47;
	Fri, 29 Mar 2024 00:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.36.192.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711671850; cv=none; b=BWDaCckLdOFr6bT7H+g3rIcpFLV5LMwzSDyy+c2dN0wa66BuWigdB7f5rKxmn1ggqdUqXZHistkT8WhDHGb+Uj4aYNVyInd+43m2deGedvLmE5nYpGjpwl0/e5xaS/qVijC00pH/MDt7IpK2GmOEm7ILhCOAYmKNLYjRq/SMdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711671850; c=relaxed/simple;
	bh=v96gUz8kQAwgYVisCFB4FLYoAC5zFWnwDZf5bidnSpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3neSo13GiWlIqcprWOPa+t49meFloA8dMltGfyrihmErk+wm8Vdl7dYR0T/n8jsg1zFFxWWiye9KO6Ho8DXa/Paqh2QGqLoT6xJKSL+tO8bTLh6f3vBTZbM6Izgec3FL/P+fWoT5t3m5KqqnBVS7f+1ntpg3GiobTlB34S8N00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com; spf=pass smtp.mailfrom=codeweavers.com; dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b=Ud4fUuRZ; arc=none smtp.client-ip=4.36.192.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codeweavers.com; s=s1; h=Message-ID:Date:Subject:Cc:To:From:Sender;
	bh=FhXoUdGluQKAN1ixThyKHKCW+R8kJz2vBHctJhH8hz0=; b=Ud4fUuRZEy+lLruOwttoT9jRYd
	uRjKoNWNTRTKqCXXttTTYbh5lIR3i/kNRgyvYaA0x/MgBbIC8hJ0wtPONbppmJu2uJOGR/6nM2vwE
	eLnDhrGij5Z1VFRIsRcQZgYVJdeyq5N0/xf+PHDsCDr+yVR6MuSIkjjqGM1i+1SXjGytrcb6+hv0u
	DPZFlC7kfwZn1cDHZbbrm0prLa1MIoLbNZ3LMAKWvY4Ny8vzioM/3U3dH4GTESOs2OU8oItbS8A49
	isM8IUHFDWhNAdOhontJ32Tjv7D3j//8j6i0vBLQdv8d5Mp2uo3c6Jn8HCwFTmSqH+OdkZnPZHiQT
	cXpue4aQ==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160] helo=camazotz.mn.codeweavers.com)
	by mail.codeweavers.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <zfigura@codeweavers.com>)
	id 1rpzlM-000iik-1H;
	Thu, 28 Mar 2024 19:06:28 -0500
From: Elizabeth Figura <zfigura@codeweavers.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	wine-devel@winehq.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Wolfram Sang <wsa@kernel.org>,
	Arkadiusz Hiler <ahiler@codeweavers.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Elizabeth Figura <zfigura@codeweavers.com>
Subject: [PATCH v3 04/30] ntsync: Introduce NTSYNC_IOC_WAIT_ANY.
Date: Thu, 28 Mar 2024 19:05:55 -0500
Message-ID: <20240329000621.148791-5-zfigura@codeweavers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329000621.148791-1-zfigura@codeweavers.com>
References: <20240329000621.148791-1-zfigura@codeweavers.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corresponds to part of the functionality of the NT syscall
NtWaitForMultipleObjects(). Specifically, it implements the behaviour where
the third argument (wait_any) is TRUE, and it does not handle alertable waits.
Those features have been split out into separate patches to ease review.

NTSYNC_IOC_WAIT_ANY is a vectored wait function similar to poll(). Unlike
poll(), it "consumes" objects when they are signaled. For semaphores, this means
decreasing one from the internal counter. At most one object can be consumed by
this function.

Up to 64 objects can be waited on at once. As soon as one is signaled, the
object with the lowest index is consumed, and that index is returned via the
"index" field.

A timeout is supported. The timeout is passed as a u64 nanosecond value, which
represents absolute time measured against either the MONOTONIC or REALTIME clock
(controlled by the flags argument). If U64_MAX is passed, the ioctl waits
indefinitely.

This ioctl validates that all objects belong to the relevant device. This is not
necessary for any technical reason related to NTSYNC_IOC_WAIT_ANY, but will be
necessary for NTSYNC_IOC_WAIT_ALL introduced in the following patch.

Two u32s of padding are left in the ntsync_wait_args structure; one will be used
by a patch later in the series (which is split out to ease review).

Signed-off-by: Elizabeth Figura <zfigura@codeweavers.com>
---
 drivers/misc/ntsync.c       | 250 ++++++++++++++++++++++++++++++++++++
 include/uapi/linux/ntsync.h |  16 +++
 2 files changed, 266 insertions(+)

diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
index 3c2f743c58b0..c6f84a5fc8c0 100644
--- a/drivers/misc/ntsync.c
+++ b/drivers/misc/ntsync.c
@@ -6,11 +6,16 @@
  */
 
 #include <linux/anon_inodes.h>
+#include <linux/atomic.h>
 #include <linux/file.h>
 #include <linux/fs.h>
+#include <linux/hrtimer.h>
+#include <linux/ktime.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/sched.h>
+#include <linux/sched/signal.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <uapi/linux/ntsync.h>
@@ -30,6 +35,8 @@ enum ntsync_type {
  *
  * Both rely on struct file for reference counting. Individual
  * ntsync_obj objects take a reference to the device when created.
+ * Wait operations take a reference to each object being waited on for
+ * the duration of the wait.
  */
 
 struct ntsync_obj {
@@ -47,12 +54,56 @@ struct ntsync_obj {
 			__u32 max;
 		} sem;
 	} u;
+
+	struct list_head any_waiters;
+};
+
+struct ntsync_q_entry {
+	struct list_head node;
+	struct ntsync_q *q;
+	struct ntsync_obj *obj;
+	__u32 index;
+};
+
+struct ntsync_q {
+	struct task_struct *task;
+	__u32 owner;
+
+	/*
+	 * Protected via atomic_try_cmpxchg(). Only the thread that wins the
+	 * compare-and-swap may actually change object states and wake this
+	 * task.
+	 */
+	atomic_t signaled;
+
+	__u32 count;
+	struct ntsync_q_entry entries[];
 };
 
 struct ntsync_device {
 	struct file *file;
 };
 
+static void try_wake_any_sem(struct ntsync_obj *sem)
+{
+	struct ntsync_q_entry *entry;
+
+	lockdep_assert_held(&sem->lock);
+
+	list_for_each_entry(entry, &sem->any_waiters, node) {
+		struct ntsync_q *q = entry->q;
+		int signaled = -1;
+
+		if (!sem->u.sem.count)
+			break;
+
+		if (atomic_try_cmpxchg(&q->signaled, &signaled, entry->index)) {
+			sem->u.sem.count--;
+			wake_up_process(q->task);
+		}
+	}
+}
+
 /*
  * Actually change the semaphore state, returning -EOVERFLOW if it is made
  * invalid.
@@ -88,6 +139,8 @@ static int ntsync_sem_post(struct ntsync_obj *sem, void __user *argp)
 
 	prev_count = sem->u.sem.count;
 	ret = post_sem_state(sem, args);
+	if (!ret)
+		try_wake_any_sem(sem);
 
 	spin_unlock(&sem->lock);
 
@@ -141,6 +194,7 @@ static struct ntsync_obj *ntsync_alloc_obj(struct ntsync_device *dev,
 	obj->dev = dev;
 	get_file(dev->file);
 	spin_lock_init(&obj->lock);
+	INIT_LIST_HEAD(&obj->any_waiters);
 
 	return obj;
 }
@@ -191,6 +245,200 @@ static int ntsync_create_sem(struct ntsync_device *dev, void __user *argp)
 	return put_user(fd, &user_args->sem);
 }
 
+static struct ntsync_obj *get_obj(struct ntsync_device *dev, int fd)
+{
+	struct file *file = fget(fd);
+	struct ntsync_obj *obj;
+
+	if (!file)
+		return NULL;
+
+	if (file->f_op != &ntsync_obj_fops) {
+		fput(file);
+		return NULL;
+	}
+
+	obj = file->private_data;
+	if (obj->dev != dev) {
+		fput(file);
+		return NULL;
+	}
+
+	return obj;
+}
+
+static void put_obj(struct ntsync_obj *obj)
+{
+	fput(obj->file);
+}
+
+static int ntsync_schedule(const struct ntsync_q *q, const struct ntsync_wait_args *args)
+{
+	ktime_t timeout = ns_to_ktime(args->timeout);
+	clockid_t clock = CLOCK_MONOTONIC;
+	ktime_t *timeout_ptr;
+	int ret = 0;
+
+	timeout_ptr = (args->timeout == U64_MAX ? NULL : &timeout);
+
+	if (args->flags & NTSYNC_WAIT_REALTIME)
+		clock = CLOCK_REALTIME;
+
+	do {
+		if (signal_pending(current)) {
+			ret = -ERESTARTSYS;
+			break;
+		}
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (atomic_read(&q->signaled) != -1) {
+			ret = 0;
+			break;
+		}
+		ret = schedule_hrtimeout_range_clock(timeout_ptr, 0, HRTIMER_MODE_ABS, clock);
+	} while (ret < 0);
+	__set_current_state(TASK_RUNNING);
+
+	return ret;
+}
+
+/*
+ * Allocate and initialize the ntsync_q structure, but do not queue us yet.
+ */
+static int setup_wait(struct ntsync_device *dev,
+		      const struct ntsync_wait_args *args,
+		      struct ntsync_q **ret_q)
+{
+	const __u32 count = args->count;
+	int fds[NTSYNC_MAX_WAIT_COUNT];
+	struct ntsync_q *q;
+	__u32 i, j;
+
+	if (!args->owner)
+		return -EINVAL;
+
+	if (args->pad || args->pad2 || (args->flags & ~NTSYNC_WAIT_REALTIME))
+		return -EINVAL;
+
+	if (args->count > NTSYNC_MAX_WAIT_COUNT)
+		return -EINVAL;
+
+	if (copy_from_user(fds, u64_to_user_ptr(args->objs),
+			   array_size(count, sizeof(*fds))))
+		return -EFAULT;
+
+	q = kmalloc(struct_size(q, entries, count), GFP_KERNEL);
+	if (!q)
+		return -ENOMEM;
+	q->task = current;
+	q->owner = args->owner;
+	atomic_set(&q->signaled, -1);
+	q->count = count;
+
+	for (i = 0; i < count; i++) {
+		struct ntsync_q_entry *entry = &q->entries[i];
+		struct ntsync_obj *obj = get_obj(dev, fds[i]);
+
+		if (!obj)
+			goto err;
+
+		entry->obj = obj;
+		entry->q = q;
+		entry->index = i;
+	}
+
+	*ret_q = q;
+	return 0;
+
+err:
+	for (j = 0; j < i; j++)
+		put_obj(q->entries[j].obj);
+	kfree(q);
+	return -EINVAL;
+}
+
+static void try_wake_any_obj(struct ntsync_obj *obj)
+{
+	switch (obj->type) {
+	case NTSYNC_TYPE_SEM:
+		try_wake_any_sem(obj);
+		break;
+	}
+}
+
+static int ntsync_wait_any(struct ntsync_device *dev, void __user *argp)
+{
+	struct ntsync_wait_args args;
+	struct ntsync_q *q;
+	int signaled;
+	__u32 i;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	ret = setup_wait(dev, &args, &q);
+	if (ret < 0)
+		return ret;
+
+	/* queue ourselves */
+
+	for (i = 0; i < args.count; i++) {
+		struct ntsync_q_entry *entry = &q->entries[i];
+		struct ntsync_obj *obj = entry->obj;
+
+		spin_lock(&obj->lock);
+		list_add_tail(&entry->node, &obj->any_waiters);
+		spin_unlock(&obj->lock);
+	}
+
+	/* check if we are already signaled */
+
+	for (i = 0; i < args.count; i++) {
+		struct ntsync_obj *obj = q->entries[i].obj;
+
+		if (atomic_read(&q->signaled) != -1)
+			break;
+
+		spin_lock(&obj->lock);
+		try_wake_any_obj(obj);
+		spin_unlock(&obj->lock);
+	}
+
+	/* sleep */
+
+	ret = ntsync_schedule(q, &args);
+
+	/* and finally, unqueue */
+
+	for (i = 0; i < args.count; i++) {
+		struct ntsync_q_entry *entry = &q->entries[i];
+		struct ntsync_obj *obj = entry->obj;
+
+		spin_lock(&obj->lock);
+		list_del(&entry->node);
+		spin_unlock(&obj->lock);
+
+		put_obj(obj);
+	}
+
+	signaled = atomic_read(&q->signaled);
+	if (signaled != -1) {
+		struct ntsync_wait_args __user *user_args = argp;
+
+		/* even if we caught a signal, we need to communicate success */
+		ret = 0;
+
+		if (put_user(signaled, &user_args->index))
+			ret = -EFAULT;
+	} else if (!ret) {
+		ret = -ETIMEDOUT;
+	}
+
+	kfree(q);
+	return ret;
+}
+
 static int ntsync_char_open(struct inode *inode, struct file *file)
 {
 	struct ntsync_device *dev;
@@ -222,6 +470,8 @@ static long ntsync_char_ioctl(struct file *file, unsigned int cmd,
 	switch (cmd) {
 	case NTSYNC_IOC_CREATE_SEM:
 		return ntsync_create_sem(dev, argp);
+	case NTSYNC_IOC_WAIT_ANY:
+		return ntsync_wait_any(dev, argp);
 	default:
 		return -ENOIOCTLCMD;
 	}
diff --git a/include/uapi/linux/ntsync.h b/include/uapi/linux/ntsync.h
index dcfa38fdc93c..60ad414b5552 100644
--- a/include/uapi/linux/ntsync.h
+++ b/include/uapi/linux/ntsync.h
@@ -16,7 +16,23 @@ struct ntsync_sem_args {
 	__u32 max;
 };
 
+#define NTSYNC_WAIT_REALTIME	0x1
+
+struct ntsync_wait_args {
+	__u64 timeout;
+	__u64 objs;
+	__u32 count;
+	__u32 owner;
+	__u32 index;
+	__u32 flags;
+	__u32 pad;
+	__u32 pad2;
+};
+
+#define NTSYNC_MAX_WAIT_COUNT 64
+
 #define NTSYNC_IOC_CREATE_SEM		_IOWR('N', 0x80, struct ntsync_sem_args)
+#define NTSYNC_IOC_WAIT_ANY		_IOWR('N', 0x82, struct ntsync_wait_args)
 
 #define NTSYNC_IOC_SEM_POST		_IOWR('N', 0x81, __u32)
 
-- 
2.43.0


