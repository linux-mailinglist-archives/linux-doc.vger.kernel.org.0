Return-Path: <linux-doc+bounces-3952-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC40803817
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 16:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 817191F2128F
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 15:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E732C859;
	Mon,  4 Dec 2023 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="FBd2rY30"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67614A1;
	Mon,  4 Dec 2023 07:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=BvR3OXM2QBAS4liqR3/BSTAsYb++/jFf5LWoqHFrm0w=; b=FBd2rY30hHb3qzxyO7THSSGJm7
	L55rwkzzTomoRNqnFhi254he9tPLWblSh5/emxvI3Onu0vs3vEC+VeNWIT+JBoWJdMOGc9sadGOkU
	B77BrVWFDKQqZoLV9UbwNphLof8wbGdgZ9FzrSnLYHE4y11yAG9qsMg5cmHFzP1lA/30=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rAAQk-00043Z-II; Mon, 04 Dec 2023 15:00:18 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=REM-PW02S00X.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rAABI-00088g-Gw; Mon, 04 Dec 2023 14:44:20 +0000
From: Paul Durrant <paul@xen.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v10 11/19] KVM: xen: allow shared_info to be mapped by fixed HVA
Date: Mon,  4 Dec 2023 14:43:26 +0000
Message-Id: <20231204144334.910-12-paul@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204144334.910-1-paul@xen.org>
References: <20231204144334.910-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

The shared_info page is not guest memory as such. It is a dedicated page
allocated by the VMM and overlaid onto guest memory in a GFN chosen by the
guest and specified in the XENMEM_add_to_physmap hypercall. The guest may
even request that shared_info be moved from one GFN to another by
re-issuing that hypercall, but the HVA is never going to change.

Because the shared_info page is an overlay the memory slots need to be
updated in response to the hypercall. However, memory slot adjustment is
not atomic and, whilst all vCPUs are paused, there is still the possibility
that events may be delivered (which requires the shared_info page to be
updated) whilst the shared_info GPA is absent. The HVA is never absent
though, so it makes much more sense to use that as the basis for the
kernel's mapping.

Hence add a new KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA attribute type for this
purpose and a KVM_XEN_HVM_CONFIG_SHARED_INFO_HVA flag to advertize its
availability. Don't actually advertize it yet though. That will be done in
a subsequent patch, which will also add tests for the new attribute type.

Also update the KVM API documentation with the new attribute and also fix
it up to consistently refer to 'shared_info' (with the underscore).

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org

v8:
 - Re-base.

v2:
 - Define the new attribute and capability but don't advertize the
   capability yet.
 - Add API documentation.
---
 Documentation/virt/kvm/api.rst | 25 ++++++++++++++++------
 arch/x86/kvm/xen.c             | 39 ++++++++++++++++++++++++++--------
 include/uapi/linux/kvm.h       |  6 +++++-
 3 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 926241e23aeb..689264502a67 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -372,7 +372,7 @@ The bits in the dirty bitmap are cleared before the ioctl returns, unless
 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is enabled.  For more information,
 see the description of the capability.
 
-Note that the Xen shared info page, if configured, shall always be assumed
+Note that the Xen shared_info page, if configured, shall always be assumed
 to be dirty. KVM will not explicitly mark it such.
 
 
@@ -5499,8 +5499,9 @@ KVM_PV_ASYNC_CLEANUP_PERFORM
 		__u8 long_mode;
 		__u8 vector;
 		__u8 runstate_update_flag;
-		struct {
+		union {
 			__u64 gfn;
+			__u64 hva;
 		} shared_info;
 		struct {
 			__u32 send_port;
@@ -5528,10 +5529,10 @@ type values:
 
 KVM_XEN_ATTR_TYPE_LONG_MODE
   Sets the ABI mode of the VM to 32-bit or 64-bit (long mode). This
-  determines the layout of the shared info pages exposed to the VM.
+  determines the layout of the shared_info page exposed to the VM.
 
 KVM_XEN_ATTR_TYPE_SHARED_INFO
-  Sets the guest physical frame number at which the Xen "shared info"
+  Sets the guest physical frame number at which the Xen shared_info
   page resides. Note that although Xen places vcpu_info for the first
   32 vCPUs in the shared_info page, KVM does not automatically do so
   and instead requires that KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO be used
@@ -5540,7 +5541,7 @@ KVM_XEN_ATTR_TYPE_SHARED_INFO
   not be aware of the Xen CPU id which is used as the index into the
   vcpu_info[] array, so may know the correct default location.
 
-  Note that the shared info page may be constantly written to by KVM;
+  Note that the shared_info page may be constantly written to by KVM;
   it contains the event channel bitmap used to deliver interrupts to
   a Xen guest, amongst other things. It is exempt from dirty tracking
   mechanisms — KVM will not explicitly mark the page as dirty each
@@ -5549,9 +5550,21 @@ KVM_XEN_ATTR_TYPE_SHARED_INFO
   any vCPU has been running or any event channel interrupts can be
   routed to the guest.
 
-  Setting the gfn to KVM_XEN_INVALID_GFN will disable the shared info
+  Setting the gfn to KVM_XEN_INVALID_GFN will disable the shared_info
   page.
 
+KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA
+  If the KVM_XEN_HVM_CONFIG_SHARED_INFO_HVA flag is also set in the
+  Xen capabilities, then this attribute may be used to set the
+  userspace address at which the shared_info page resides, which
+  will always be fixed in the VMM regardless of where it is mapped
+  in guest physical address space. This attribute should be used in
+  preference to KVM_XEN_ATTR_TYPE_SHARED_INFO as it avoids
+  unnecessary invalidation of an internal cache when the page is
+  re-mapped in guest physcial address space.
+
+  Setting the hva to zero will disable the shared_info page.
+
 KVM_XEN_ATTR_TYPE_UPCALL_VECTOR
   Sets the exception vector used to deliver Xen event channel upcalls.
   This is the HVM-wide vector injected directly by the hypervisor
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 3aa452a71890..d65b62f19440 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -617,7 +617,6 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
 {
 	int r = -ENOENT;
 
-
 	switch (data->type) {
 	case KVM_XEN_ATTR_TYPE_LONG_MODE:
 		if (!IS_ENABLED(CONFIG_64BIT) && data->u.long_mode) {
@@ -640,20 +639,32 @@ int kvm_xen_hvm_set_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
 		}
 		break;
 
-	case KVM_XEN_ATTR_TYPE_SHARED_INFO: {
+	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
+	case KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA: {
 		int idx;
 
 		mutex_lock(&kvm->arch.xen.xen_lock);
 
 		idx = srcu_read_lock(&kvm->srcu);
 
-		if (data->u.shared_info.gfn == KVM_XEN_INVALID_GFN) {
-			kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
-			r = 0;
+		if (data->type == KVM_XEN_ATTR_TYPE_SHARED_INFO) {
+			if (data->u.shared_info.gfn == KVM_XEN_INVALID_GFN) {
+				kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
+				r = 0;
+			} else {
+				r = kvm_gpc_activate(&kvm->arch.xen.shinfo_cache,
+						     gfn_to_gpa(data->u.shared_info.gfn),
+						     PAGE_SIZE);
+			}
 		} else {
-			r = kvm_gpc_activate(&kvm->arch.xen.shinfo_cache,
-					     gfn_to_gpa(data->u.shared_info.gfn),
-					     PAGE_SIZE);
+			if (data->u.shared_info.hva == 0) {
+				kvm_gpc_deactivate(&kvm->arch.xen.shinfo_cache);
+				r = 0;
+			} else {
+				r = kvm_gpc_activate_hva(&kvm->arch.xen.shinfo_cache,
+							 data->u.shared_info.hva,
+							 PAGE_SIZE);
+			}
 		}
 
 		srcu_read_unlock(&kvm->srcu, idx);
@@ -714,13 +725,23 @@ int kvm_xen_hvm_get_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
 		break;
 
 	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
-		if (kvm->arch.xen.shinfo_cache.active)
+		if (kvm->arch.xen.shinfo_cache.active &&
+		    kvm->arch.xen.shinfo_cache.gpa != KVM_XEN_INVALID_GPA)
 			data->u.shared_info.gfn = gpa_to_gfn(kvm->arch.xen.shinfo_cache.gpa);
 		else
 			data->u.shared_info.gfn = KVM_XEN_INVALID_GFN;
 		r = 0;
 		break;
 
+	case KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA:
+		if (kvm->arch.xen.shinfo_cache.active &&
+		    kvm->arch.xen.shinfo_cache.gpa == KVM_XEN_INVALID_GPA)
+			data->u.shared_info.hva = kvm->arch.xen.shinfo_cache.uhva;
+		else
+			data->u.shared_info.hva = 0;
+		r = 0;
+		break;
+
 	case KVM_XEN_ATTR_TYPE_UPCALL_VECTOR:
 		data->u.vector = kvm->arch.xen.upcall_vector;
 		r = 0;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index e9cb2df67a1d..32cf3432a507 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1318,6 +1318,7 @@ struct kvm_x86_mce {
 #define KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL	(1 << 4)
 #define KVM_XEN_HVM_CONFIG_EVTCHN_SEND		(1 << 5)
 #define KVM_XEN_HVM_CONFIG_RUNSTATE_UPDATE_FLAG	(1 << 6)
+#define KVM_XEN_HVM_CONFIG_SHARED_INFO_HVA	(1 << 7)
 
 struct kvm_xen_hvm_config {
 	__u32 flags;
@@ -1833,9 +1834,10 @@ struct kvm_xen_hvm_attr {
 		__u8 long_mode;
 		__u8 vector;
 		__u8 runstate_update_flag;
-		struct {
+		union {
 			__u64 gfn;
 #define KVM_XEN_INVALID_GFN ((__u64)-1)
+			__u64 hva;
 		} shared_info;
 		struct {
 			__u32 send_port;
@@ -1877,6 +1879,8 @@ struct kvm_xen_hvm_attr {
 #define KVM_XEN_ATTR_TYPE_XEN_VERSION		0x4
 /* Available with KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_RUNSTATE_UPDATE_FLAG */
 #define KVM_XEN_ATTR_TYPE_RUNSTATE_UPDATE_FLAG	0x5
+/* Available with KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO_HVA */
+#define KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA	0x6
 
 /* Per-vCPU Xen attributes */
 #define KVM_XEN_VCPU_GET_ATTR	_IOWR(KVMIO, 0xca, struct kvm_xen_vcpu_attr)
-- 
2.39.2


